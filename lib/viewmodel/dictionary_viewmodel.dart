import 'package:flutter/material.dart';
import '../core/api/dictionary_api.dart';
import '../core/api/translate_api.dart';
import '../model/dictionary_model.dart';
import '../core/data/offline_dictionary_data.dart';

class DictionaryViewModel extends ChangeNotifier {
  DictionaryModel? dictionary;
  bool isLoading = false;
  Set<int> hindiLoadingIndexes = {};
  String? error;
  String? transliteration;
  Map<int, String> hindiMeanings = {};

  Future<void> search(String word) async {
    String query = word.trim();
    if (query.isEmpty) return;

    isLoading = true;
    error = null;
    dictionary = null;
    transliteration = null;
    hindiMeanings.clear();
    hindiLoadingIndexes.clear();
    notifyListeners();

    // 1️⃣ Detect Hindi and translate to English if needed (Bidirectional Search)
    bool isHindi = RegExp(r"[\u0900-\u097F]").hasMatch(query);
    if (isHindi) {
      final translated = await TranslateApi.toEnglish(query);
      if (translated.isNotEmpty) query = translated;
    }

    // 2️⃣ Fetch dictionary data
    var data = await DictionaryApi.getWord(query);

    // 3️⃣ Offline Fallback
    if (data == null &&
        offlineDictionaryData.containsKey(query.toLowerCase())) {
      final offline = offlineDictionaryData[query.toLowerCase()]!;
      data = {
        'word': offline['word'],
        'phonetics': [
          {'text': '', 'audio': ''},
        ],
        'meanings': [
          {
            'partOfSpeech': 'offline',
            'definitions': [
              {'definition': offline['definition']},
            ],
          },
        ],
        'synonyms': [],
        'antonyms': [],
        'examples': [],
      };
      // For offline, we might want to pre-set the hindi meaning
      hindiMeanings[0] = offline['hindi'];
    }

    if (data == null) {
      error = "Word not found";
      isLoading = false;
      notifyListeners();
      return;
    }

    dictionary = DictionaryModel.fromJson(data);

    // 4️⃣ Get Hindi Transliteration for the search term (Pronunciation support)
    transliteration = await TranslateApi.toHindiPhonetic(dictionary!.word);

    isLoading = false;
    notifyListeners();

    // 5️⃣ Translate each part of speech separately
    for (int i = 0; i < dictionary!.meanings.length; i++) {
      final meaning = dictionary!.meanings[i];
      if (meaning is! Map ||
          meaning['definitions'] is! List ||
          (meaning['definitions'] as List).isEmpty) {
        continue;
      }

      final english =
          (meaning['definitions'] as List).first['definition'] ?? "";
      if (english.isEmpty) {
        continue;
      }

      hindiLoadingIndexes.add(i);
      notifyListeners();

      final hindi = await TranslateApi.toHindi(english);
      hindiMeanings[i] = hindi;
      hindiLoadingIndexes.remove(i);
      notifyListeners();
    }
  }
}
