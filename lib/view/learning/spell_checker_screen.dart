import 'package:flutter/material.dart';
import 'dart:math';
import '../../core/data/wotd_data.dart';
import '../../core/service/word_of_the_day_service.dart';
import 'spelling_bee_screen.dart';

class SpellCheckerScreen extends StatefulWidget {
  const SpellCheckerScreen({super.key});

  @override
  State<SpellCheckerScreen> createState() => _SpellCheckerScreenState();
}

class _SpellCheckerScreenState extends State<SpellCheckerScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String> suggestions = [];
  bool isSearching = false;
  String? queriedWord;

  // Simple Levenshtein distance for suggestions
  int _getLevenshteinDistance(String s1, String s2) {
    if (s1 == s2) return 0;
    if (s1.isEmpty) return s2.length;
    if (s2.isEmpty) return s1.length;

    List<int> prev = List.generate(s2.length + 1, (i) => i);
    List<int> curr = List.filled(s2.length + 1, 0);

    for (int i = 0; i < s1.length; i++) {
      curr[0] = i + 1;
      for (int j = 0; j < s2.length; j++) {
        int cost = s1[i] == s2[j] ? 0 : 1;
        curr[j + 1] = [
          curr[j] + 1,
          prev[j + 1] + 1,
          prev[j] + cost,
        ].reduce(min);
      }
      prev = List.from(curr);
    }
    return curr[s2.length];
  }

  Future<void> _checkSpelling() async {
    final query = _controller.text.trim().toLowerCase();
    if (query.isEmpty) return;

    setState(() {
      isSearching = true;
      queriedWord = query;
    });

    // Collect all words from master list and history
    final history = await WordOfTheDayService.getHistory();
    final allWords = <String>{};
    for (var item in wotdMasterList) {
      if (item['word'] != null) {
        allWords.add(item['word']!.toLowerCase());
      }
    }
    for (var item in history) {
      if (item['word'] != null) {
        allWords.add(item['word'].toString().toLowerCase());
      }
    }

    if (allWords.contains(query)) {
      setState(() {
        suggestions = [query];
        isSearching = false;
      });
      return;
    }

    // Find best suggestions
    final List<MapEntry<String, int>> typedSuggestions = [];
    for (var word in allWords) {
      int dist = _getLevenshteinDistance(query, word);
      if (dist <= 3) {
        typedSuggestions.add(MapEntry(word, dist));
      }
    }

    typedSuggestions.sort((a, b) => a.value.compareTo(b.value));

    setState(() {
      suggestions = typedSuggestions.map((e) => e.key).take(5).toList();
      isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Spell Checker")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Type a word to check...",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _checkSpelling,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onSubmitted: (_) => _checkSpelling(),
            ),
            const SizedBox(height: 32),
            if (isSearching)
              const CircularProgressIndicator()
            else if (queriedWord != null)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      suggestions.contains(queriedWord)
                          ? "Spelling is correct!"
                          : "Did you mean?",
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: suggestions.contains(queriedWord)
                            ? Colors.green
                            : theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: suggestions.length,
                        itemBuilder: (context, index) {
                          final word = suggestions[index];
                          return Card(
                            margin: const EdgeInsets.only(bottom: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              title: Text(
                                word,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              ),
                              onTap: () {
                                // Just show a dialog for now or navigate to dictionary
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Selected: $word")),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    if (suggestions.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SpellingBeeScreen(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.psychology),
                          label: const Text("Practice these words in Jumble"),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
