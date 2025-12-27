import 'dart:convert';
import 'package:http/http.dart' as http;

class SuggestionApi {
  static Future<List<String>> getSuggestions(String query) async {
    if (query.isEmpty) return [];

    final url = Uri.parse("https://api.datamuse.com/sug?s=$query&max=8");

    final response = await http.get(url);

    if (response.statusCode != 200) return [];

    final List data = jsonDecode(response.body);
    return data.map<String>((e) => e['word'].toString()).toList();
  }
}
