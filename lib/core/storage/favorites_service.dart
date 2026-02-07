import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService {
  static const String _key = 'favorite_words';

  /// Get all favorite words with their added dates
  /// Returns a list of Map<String, dynamic> e.g. [{'word': 'coffee', 'date': '2024-05-21'}]
  static Future<List<Map<String, dynamic>>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> rawList = prefs.getStringList(_key) ?? [];

    // Legacy support: if list contains plain strings (old version), convert them
    List<Map<String, dynamic>> favorites = [];

    for (String item in rawList) {
      try {
        final Map<String, dynamic> data = jsonDecode(item);
        favorites.add(data);
      } catch (e) {
        // format is just a string (legacy)
        favorites.add({
          'word': item,
          'date': DateTime.now()
              .toIso8601String()
              .split('T')
              .first, // default to today if unknown
        });
      }
    }

    return favorites;
  }

  /// Check if word is favorite
  static Future<bool> isFavorite(String word) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> rawList = prefs.getStringList(_key) ?? [];

    final target = word.toLowerCase();

    for (String item in rawList) {
      try {
        final Map<String, dynamic> data = jsonDecode(item);
        if (data['word'].toString().toLowerCase() == target) return true;
      } catch (e) {
        if (item.toLowerCase() == target) return true;
      }
    }
    return false;
  }

  static Future<void> clearFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }

  /// Toggle favorite
  static Future<void> toggleFavorite(String word) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> rawList = prefs.getStringList(_key) ?? [];
    final target = word.toLowerCase();

    int indexToRemove = -1;

    for (int i = 0; i < rawList.length; i++) {
      String item = rawList[i];
      try {
        final Map<String, dynamic> data = jsonDecode(item);
        if (data['word'].toString().toLowerCase() == target) {
          indexToRemove = i;
          break;
        }
      } catch (e) {
        if (item.toLowerCase() == target) {
          indexToRemove = i;
          break;
        }
      }
    }

    if (indexToRemove != -1) {
      rawList.removeAt(indexToRemove);
    } else {
      // Add new
      final newItem = {
        'word': word,
        'date': DateTime.now().toIso8601String().split('T').first,
      };
      rawList.add(jsonEncode(newItem));
    }

    await prefs.setStringList(_key, rawList);
  }
}
