import 'package:flutter/material.dart';

import '../core/api/dictionary_api.dart';
import '../core/api/translate_api.dart';
import '../model/dictionary_model.dart';

class DictionaryViewModel extends ChangeNotifier {
  DictionaryModel? dictionary;
  bool isLoading = false;
  Set<int> hindiLoadingIndexes = {};
  String? error;

  Map<int, String> hindiMeanings = {};

  Future<void> search(String word) async {
    if (word.trim().isEmpty) return;

    isLoading = true;
    error = null;
    dictionary = null;

    hindiMeanings.clear();
    hindiLoadingIndexes.clear();

    notifyListeners();

    // 1️⃣ Fetch dictionary data
    final data = await DictionaryApi.getWord(word);

    if (data == null) {
      error = "Word not found";
      isLoading = false;
      notifyListeners();
      return;
    }

    dictionary = DictionaryModel.fromJson(data);
    isLoading = false;
    notifyListeners(); // show English meanings first

    // 2️⃣ Translate each part of speech separately
    for (int i = 0; i < dictionary!.meanings.length; i++) {
      final meaning = dictionary!.meanings[i];

      if (meaning is! Map ||
          meaning['definitions'] is! List ||
          (meaning['definitions'] as List).isEmpty) {
        continue;
      }

      final english =
          (meaning['definitions'] as List).first['definition'] ?? "";

      if (english.isEmpty) continue;

      hindiLoadingIndexes.add(i);
      notifyListeners();

      final hindi = await TranslateApi.toHindi(english);

      hindiMeanings[i] = hindi;
      hindiLoadingIndexes.remove(i);

      notifyListeners();
    }
  }
}
