class DictionaryModel {
  final String word;
  final List<dynamic> phonetics;
  final List<dynamic> meanings;

  DictionaryModel({
    required this.word,
    required this.phonetics,
    required this.meanings,
  });

  /// Factory constructor to create model from API JSON
  factory DictionaryModel.fromJson(Map<String, dynamic> json) {
    return DictionaryModel(
      word: json['word'] ?? '',
      phonetics: json['phonetics'] ?? [],
      meanings: json['meanings'] ?? [],
    );
  }
}
