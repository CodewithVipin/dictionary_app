import 'dart:convert';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/wotd_data.dart';
import '../api/dictionary_api.dart';

class WordOfTheDayService {
  static const String _currentWotdKey = 'current_wotd';
  static const String _historyKey = 'wotd_history';
  static const String _lastSeenDateKey = 'last_seen_wotd_date';

  /// Get today's word. If not set or date changed, pick new one.
  static Future<Map<String, dynamic>?> getWordOfTheDay() async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedWotd = prefs.getString(_currentWotdKey);
    final String today = DateTime.now().toIso8601String().split('T').first;

    if (storedWotd != null) {
      final Map<String, dynamic> wotd = jsonDecode(storedWotd);
      if (wotd['date'] == today) {
        return wotd;
      }
    }

    // New day, new word
    return await _generateNewWord(prefs, today);
  }

  static Future<Map<String, dynamic>?> _generateNewWord(
    SharedPreferences prefs,
    String date,
  ) async {
    final random = Random();

    // 1. Get history to avoid repeats
    final List<String> historyJson = prefs.getStringList(_historyKey) ?? [];
    final Set<String> seenWords = historyJson.map((e) {
      try {
        final map = jsonDecode(e);
        return (map['word'] as String).toLowerCase();
      } catch (_) {
        return '';
      }
    }).toSet();

    // 2. Filter master list for unseen words
    final availableWords = wotdMasterList.where((element) {
      return !seenWords.contains(element['word']!.toLowerCase());
    }).toList();

    // 3. Fallback if user has seen EVERYTHING (after 5+ years!)
    final List<Map<String, String>> candidates = availableWords.isNotEmpty
        ? availableWords
        : wotdMasterList;

    // 4. Pick random word
    final selection = candidates[random.nextInt(candidates.length)];
    final String word = selection['word']!;
    final String hindi = selection['hindi']!;

    // 5. Fetch API details (optional but good for synonyms/examples)
    // We proceed even if API fails, using our local data backup
    final apiData = await DictionaryApi.getWord(word);

    // Extract audio if available for offline games like Spelling Bee
    String? audio;
    if (apiData != null && apiData['phonetics'] is List) {
      for (var p in apiData['phonetics']) {
        if (p['audio'] != null && p['audio'].toString().isNotEmpty) {
          audio = p['audio'].toString();
          break;
        }
      }
    }

    // Construct the WOTD object
    // We merge API data if available, but primarily rely on our list for the word itself
    final newWotd = {
      'word': word,
      'hindi': hindi,
      'date': date,
      'audio': audio, // Save for offline games
      'def': apiData != null
          ? apiData['meanings']
          : [], // Fallback if API fails
      // Store minimal data needed for history/display
    };

    // 6. Save
    await prefs.setString(_currentWotdKey, jsonEncode(newWotd));
    await _addToHistory(prefs, newWotd);

    return newWotd;
  }

  static Future<void> _addToHistory(
    SharedPreferences prefs,
    Map<String, dynamic> wotd,
  ) async {
    final List<String> history = prefs.getStringList(_historyKey) ?? [];

    // Add to top
    history.insert(0, jsonEncode(wotd));

    // We don't limit history to 50 anymore because we need it to track "seen" words
    // But maybe we limit it to 2000? For now, unlimited or matching list size is fine.

    await prefs.setStringList(_historyKey, history);
  }

  /// Check if we should show the WOTD dialog (i.e. not shown today yet)
  static Future<bool> shouldShow() async {
    final prefs = await SharedPreferences.getInstance();
    final String? lastSeen = prefs.getString(_lastSeenDateKey);
    final String today = DateTime.now().toIso8601String().split('T').first;
    return lastSeen != today;
  }

  /// Mark WOTD as shown for today
  static Future<void> markAsShown() async {
    final prefs = await SharedPreferences.getInstance();
    final String today = DateTime.now().toIso8601String().split('T').first;
    await prefs.setString(_lastSeenDateKey, today);
  }

  static Future<List<Map<String, dynamic>>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> raw = prefs.getStringList(_historyKey) ?? [];
    return raw.map((e) => jsonDecode(e) as Map<String, dynamic>).toList();
  }
}
