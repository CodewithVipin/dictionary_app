import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class MasteryService {
  static const String _key = 'word_mastery';

  static Future<void> recordInteraction(
    String word, {
    bool isCorrect = true,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_key);
    Map<String, dynamic> mastery = data != null ? jsonDecode(data) : {};

    if (!mastery.containsKey(word)) {
      mastery[word] = {'correct': 0, 'total': 0, 'level': 0};
    }

    mastery[word]['total'] += 1;
    if (isCorrect) {
      mastery[word]['correct'] += 1;
    }

    // Calculate level (0 to 5)
    double ratio = mastery[word]['correct'] / mastery[word]['total'];
    int total = mastery[word]['total'];

    if (total > 5 && ratio > 0.8) {
      mastery[word]['level'] = 5;
    } else if (total > 3 && ratio > 0.7) {
      mastery[word]['level'] = 4;
    } else if (total > 2 && ratio > 0.6) {
      mastery[word]['level'] = 3;
    } else if (total > 1) {
      mastery[word]['level'] = 2;
    } else {
      mastery[word]['level'] = 1;
    }

    await prefs.setString(_key, jsonEncode(mastery));
  }

  static Future<Map<String, dynamic>> getAllMastery() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_key);
    return data != null ? jsonDecode(data) : {};
  }

  static Future<Map<String, int>> getStats() async {
    final mastery = await getAllMastery();
    int master = 0; // Level 4-5
    int learning = 0; // Level 2-3
    int newWords = 0; // Level 1

    mastery.forEach((key, value) {
      int level = value['level'];
      if (level >= 4) {
        master++;
      } else if (level >= 2) {
        learning++;
      } else {
        newWords++;
      }
    });

    return {
      'mastered': master,
      'learning': learning,
      'new': newWords,
      'total': mastery.length,
    };
  }
}
