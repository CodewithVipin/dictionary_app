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

      // 🔑 Extract translated text
      return data[0][0][0].toString();
    } catch (e) {
      return "";
    }
  }
}
