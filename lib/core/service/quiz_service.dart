import 'package:flutter/foundation.dart';
import '../service/word_of_the_day_service.dart';
import '../data/wotd_data.dart';

class QuizQuestion {
  final String word;
  final String correctAnswer;
  final List<String> options;
  final String? hindi;
  final String? example;

  QuizQuestion({
    required this.word,
    required this.correctAnswer,
    required this.options,
    this.hindi,
    this.example,
  });
}

class QuizService {
  static Future<List<QuizQuestion>> generateQuiz() async {
    try {
      final history = await WordOfTheDayService.getHistory();

      // 1. Collect all candidate words
      List<Map<String, dynamic>> sourceWords = [];

      // Add from history
      for (var item in history) {
        if (item['word'] != null && item['word'].toString().isNotEmpty) {
          sourceWords.add(item);
        }
      }

      // Supplement from master list to ensure we have enough candidates for 50
      final existingWords = sourceWords
          .map((e) => e['word'].toString().toLowerCase())
          .toSet();
      for (var item in wotdMasterList) {
        if (!existingWords.contains(item['word']?.toLowerCase())) {
          sourceWords.add({'word': item['word'], 'hindi': item['hindi']});
        }
      }

      sourceWords.shuffle();

      final List<QuizQuestion> questions = [];
      const int targetCount = 50;

      // Pool for distractors (English meanings)
      final List<String> definitionPool = [
        "A feeling of great happiness and well-being",
        "The ability to recover quickly from difficulties",
        "Something that exists for a very short time",
        "The state of being alone, often by choice",
        "A mysterious or complicated journey",
        "A solution or remedy for all difficulties",
        "Showing or motivated by balanced feelings",
        "Clear and easy to understand",
        "Existing or being everywhere at the same time",
        "To waver between different opinions or actions",
        "A state of feeling of calmness and peace",
        "Full of energy and enthusiasm",
        "Extremely beautiful and delicate",
        "Lasting for a very short time",
        "The quality of being prompt and eager",
      ];

      // Also extract from history items that have 'def'
      for (var item in history) {
        final defs = item['def'] as List?;
        if (defs != null && defs.isNotEmpty) {
          final firstMeaning = defs[0];
          if (firstMeaning['definitions'] is List &&
              (firstMeaning['definitions'] as List).isNotEmpty) {
            final d = firstMeaning['definitions'][0]['definition'];
            if (d != null) definitionPool.add(d);
          }
        }
      }

      for (var item in sourceWords) {
        if (questions.length >= targetCount) break;

        final word = item['word'].toString();
        String correctDef = "";
        String? hindi = item['hindi']?.toString();
        String? example;

        // Try to get definition from history item
        final defs = item['def'] as List?;
        if (defs != null && defs.isNotEmpty) {
          final firstMeaning = defs[0];
          if (firstMeaning['definitions'] is List &&
              (firstMeaning['definitions'] as List).isNotEmpty) {
            correctDef = firstMeaning['definitions'][0]['definition'] ?? "";
          }
        }

        if (correctDef.isEmpty) {
          // Placeholder for master list items
          correctDef = "The quality or state associated with $word";
        }

        if (item['examples'] is List && (item['examples'] as List).isNotEmpty) {
          example = item['examples'][0];
        }

        // Generate 3 distractors
        List<String> distractors = definitionPool
            .where((d) => d != correctDef)
            .toList();
        distractors.shuffle();

        List<String> options = [correctDef];
        options.addAll(distractors.take(3));
        options.shuffle();

        questions.add(
          QuizQuestion(
            word: word,
            correctAnswer: correctDef,
            options: options,
            hindi: hindi,
            example: example,
          ),
        );
      }

      return questions;
    } catch (e) {
      debugPrint("Error generating quiz: $e");
      return [];
    }
  }
}
