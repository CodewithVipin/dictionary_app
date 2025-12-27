import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService {
  static const String _key = 'favorite_words';

  /// Get all favorite words
  static Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  /// Check if word is favorite
  static Future<bool> isFavorite(String word) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];
    return list.contains(word.toLowerCase());
  }

  static Future<void> clearFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }

  /// Toggle favorite
  static Future<void> toggleFavorite(String word) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];

    final w = word.toLowerCase();

    if (list.contains(w)) {
      list.remove(w);
    } else {
      list.add(w);
    }

    await prefs.setStringList(_key, list);
  }
}
