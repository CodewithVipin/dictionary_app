import 'dart:convert';
import 'package:http/http.dart' as http;

class DictionaryApi {
  static const String _baseUrl =
      'https://api.dictionaryapi.dev/api/v2/entries/en/';

  /// Fetch dictionary data for a given word
  static Future<Map<String, dynamic>?> getWord(String word) async {
    if (word.trim().isEmpty) return null;

    final Uri url = Uri.parse(_baseUrl + word.toLowerCase());

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        return data.first;
      } else {
        return null;
      }
    } catch (e) {
      // Network error / parsing error
      return null;
    }
  }
}
