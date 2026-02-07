import 'dart:convert';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/dictionary_api.dart';

class WordOfTheDayService {
  static const String _currentWotdKey = 'current_wotd';
  static const String _historyKey = 'wotd_history';

  // Fallback/Seed list of words
  static final List<String> _wordList = [
    "Serendipity",
    "Ephemeral",
    "Luminous",
    "Solitude",
    "Aurora",
    "Melancholy",
    "Euphoria",
    "Resilience",
    "Ineffable",
    "Ethereal",
    "Petrichor",
    "Sonorous",
    "Vellichor",
    "Defenestration",
    "Sonder",
    "Bungalow",
    "Incandescent",
    "Supine",
    "Epoch",
    "Mellifluous",
    "Labyrinth",
    "Panacea",
    "Surreal",
    "Obscure",
    "Vestige",
    "Zenith",
    "Nadir",
    "Quintessential",
    "Idyllic",
    "Halcyon",
  ];

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
    String word = _wordList[random.nextInt(_wordList.length)];

    // Try to get definition to ensure it's valid
    // Note: In a real app we might want to pre-fetch these or store them locally to avoid API calls on startup failure
    // For now we just pick a word and hope it has a definition, or we could fetch it here.
    // Let's store just the word and date, and let the UI fetch the details.
    // BUT user wants it to appear on opening.

    // Let's fetch it to be sure it exists.
    final data = await DictionaryApi.getWord(word);

    if (data != null) {
      final newWotd = {'word': word, 'date': date};

      await prefs.setString(_currentWotdKey, jsonEncode(newWotd));
      await _addToHistory(prefs, newWotd);
      return newWotd;
    } else {
      // Retry logic or fallback could go here
      return null;
    }
  }

  static Future<void> _addToHistory(
    SharedPreferences prefs,
    Map<String, dynamic> wotd,
  ) async {
    final List<String> history = prefs.getStringList(_historyKey) ?? [];

    // Check if already in history (idempotency)
    // We store as list of JSON strings
    // If list is long, maybe trim it?

    history.insert(0, jsonEncode(wotd)); // Add to top
    if (history.length > 50) {
      history.removeLast();
    }

    await prefs.setStringList(_historyKey, history);
  }

  static const String _lastSeenDateKey = 'last_seen_wotd_date';

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
