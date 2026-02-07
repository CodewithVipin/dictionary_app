class DictionaryModel {
  final String word;
  final List<dynamic> phonetics;
  final List<dynamic> meanings;
  final List<String> synonyms;
  final List<String> antonyms;
  final List<String> examples;

  DictionaryModel({
    required this.word,
    required this.phonetics,
    required this.meanings,
    required this.synonyms,
    required this.antonyms,
    required this.examples,
  });

  /// Factory constructor to create model from API JSON
  factory DictionaryModel.fromJson(Map<String, dynamic> json) {
    final meanings = json['meanings'] as List? ?? [];

    final Set<String> syns = {};
    final Set<String> ants = {};
    final List<String> exps = [];

    for (var meaning in meanings) {
      if (meaning is Map) {
        // 1. Level: Meanings
        if (meaning['synonyms'] is List) {
          syns.addAll((meaning['synonyms'] as List).map((e) => e.toString()));
        }
        if (meaning['antonyms'] is List) {
          ants.addAll((meaning['antonyms'] as List).map((e) => e.toString()));
        }

        // 2. Level: Definitions
        if (meaning['definitions'] is List) {
          for (var def in meaning['definitions']) {
            if (def is Map) {
              if (def['synonyms'] is List) {
                syns.addAll((def['synonyms'] as List).map((e) => e.toString()));
              }
              if (def['antonyms'] is List) {
                ants.addAll((def['antonyms'] as List).map((e) => e.toString()));
              }
              if (def['example'] != null &&
                  def['example'].toString().isNotEmpty) {
                exps.add(def['example'].toString());
              }
            }
          }
        }
      }
    }

    return DictionaryModel(
      word: json['word'] ?? '',
      phonetics: json['phonetics'] ?? [],
      meanings: meanings,
      synonyms: syns.take(5).toList(), // Limit to 5
      antonyms: ants.take(5).toList(), // Limit to 5
      examples: exps.take(5).toList(), // Limit to 5
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'phonetics': phonetics,
      'meanings': meanings,
      'synonyms': synonyms,
      'antonyms': antonyms,
      'examples': examples,
    };
  }
}
