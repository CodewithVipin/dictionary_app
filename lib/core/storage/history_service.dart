import 'package:shared_preferences/shared_preferences.dart';

class HistoryService {
  static const String _key = 'search_history';

  static Future<void> addSearch(String word) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList(_key) ?? [];

    // Remove if already exists (to move to top)
    history.removeWhere((item) => item.toLowerCase() == word.toLowerCase());

    // Add to front
    history.insert(0, word);

    // Keep only last 20
    if (history.length > 20) {
      history = history.sublist(0, 20);
    }

    await prefs.setStringList(_key, history);
  }

  static Future<List<String>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  static Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
