import 'dart:convert';
import 'package:http/http.dart' as http;

class TranslateApi {
  static Future<String> toHindi(String englishText) async {
    if (englishText.trim().isEmpty) return "";

    final uri = Uri.parse(
      "https://translate.googleapis.com/translate_a/single"
      "?client=gtx"
      "&sl=en"
      "&tl=hi"
      "&dt=t"
      "&q=${Uri.encodeComponent(englishText)}",
    );

    try {
      final response = await http.get(uri);
      if (response.statusCode != 200) return "";
      final data = jsonDecode(response.body);
      return data[0][0][0].toString();
    } catch (e) {
      return "";
    }
  }

  static Future<String> toEnglish(String hindiText) async {
    if (hindiText.trim().isEmpty) return "";

    final uri = Uri.parse(
      "https://translate.googleapis.com/translate_a/single"
      "?client=gtx"
      "&sl=hi"
      "&tl=en"
      "&dt=t"
      "&q=${Uri.encodeComponent(hindiText)}",
    );

    try {
      final response = await http.get(uri);
      if (response.statusCode != 200) return "";
      final data = jsonDecode(response.body);
      return data[0][0][0].toString();
    } catch (e) {
      return "";
    }
  }

  static Future<String> toHindiPhonetic(String englishWord) async {
    if (englishWord.trim().isEmpty) return "";

    final uri = Uri.parse(
      "https://translate.googleapis.com/translate_a/single"
      "?client=gtx"
      "&sl=en"
      "&tl=hi"
      "&dt=t"
      "&dt=rm"
      "&q=${Uri.encodeComponent(englishWord)}",
    );

    try {
      final response = await http.get(uri);
      if (response.statusCode != 200) return "";
      final data = jsonDecode(response.body);

      if (data[0] != null &&
          data[0].length > 1 &&
          data[0][1] != null &&
          data[0][1].length > 2) {
        return data[0][1][3] ?? "";
      }
      return "";
    } catch (e) {
      return "";
    }
  }
}
