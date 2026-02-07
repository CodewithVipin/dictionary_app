import 'package:flutter/material.dart';
import '../../core/service/word_of_the_day_service.dart';
import '../../core/storage/favorites_service.dart';
import '../../core/audio/audio_service.dart';

class SpellingBeeScreen extends StatefulWidget {
  const SpellingBeeScreen({super.key});

  @override
  State<SpellingBeeScreen> createState() => _SpellingBeeScreenState();
}

class _SpellingBeeScreenState extends State<SpellingBeeScreen> {
  List<Map<String, dynamic>> words = [];
  int currentIndex = 0;
  final TextEditingController _controller = TextEditingController();
  bool isLoading = true;
  String? feedback;
  bool isCorrect = false;
  String? audioUrl;
  String jumbledWord = "";
  String currentHint = "";

  @override
  void initState() {
    super.initState();
    _loadWords();
  }

  String _jumble(String word) {
    if (word.length <= 1) return word;
    List<String> letters = word.split('');
    do {
      letters.shuffle();
    } while (letters.join('') == word);
    return letters.join(' ');
  }

  Future<void> _loadWords() async {
    setState(() => isLoading = true);

    final history = await WordOfTheDayService.getHistory();
    final favorites = await FavoritesService.getFavorites();

    List<Map<String, dynamic>> wordsPool = [];

    // Process History
    for (var item in history) {
      if (item['word'] != null) {
        String? h;
        if (item['synonyms'] is List && (item['synonyms'] as List).isNotEmpty) {
          h = (item['synonyms'] as List).first;
        } else if (item['hindi'] != null) {
          h = item['hindi'];
        }

        wordsPool.add({
          'word': item['word'],
          'audio': item['audio'],
          'hint': h,
        });
      }
    }

    // Process Favorites
    for (var fav in favorites) {
      final cached = fav['cached_data'];
      String? aUrl;
      String? h;

      if (cached != null) {
        if (cached['phonetics'] is List) {
          for (var p in cached['phonetics']) {
            if (p['audio'] != null && p['audio'].toString().isNotEmpty) {
              aUrl = p['audio'];
              break;
            }
          }
        }
        if (cached['synonyms'] is List &&
            (cached['synonyms'] as List).isNotEmpty) {
          h = (cached['synonyms'] as List).first;
        }
      }

      wordsPool.add({
        'word': fav['word'],
        'audio': aUrl,
        'hint': h ?? "A vocabulary word you saved",
      });
    }

    wordsPool.shuffle();

    if (mounted) {
      setState(() {
        words = wordsPool;
        isLoading = false;
        if (words.isNotEmpty) {
          _updateCurrentWord();
        }
      });
    }
  }

  void _updateCurrentWord() {
    final w = words[currentIndex];
    audioUrl = w['audio'];
    jumbledWord = _jumble(w['word'].toString().toUpperCase());
    currentHint = w['hint'] ?? "Mystery word";
  }

  void _playAudio() {
    if (audioUrl != null) {
      AudioService.play(audioUrl!);
    }
  }

  void _checkWord() {
    final input = _controller.text.trim().toLowerCase();
    final target = words[currentIndex]['word'].toString().toLowerCase();

    setState(() {
      if (input == target) {
        isCorrect = true;
        feedback = "Excellent! You got the order right.";
      } else {
        isCorrect = false;
        feedback = "Not quite. Try rearranging the letters!";
      }
    });

    if (isCorrect) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted && currentIndex < words.length - 1) {
          setState(() {
            currentIndex++;
            _updateCurrentWord();
            _controller.clear();
            feedback = null;
            isCorrect = false;
          });
        } else if (currentIndex == words.length - 1) {
          setState(() {
            feedback = "Trophy Unlocked! You've solved all jumbles.";
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Jumbled Word")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : words.isEmpty
          ? const Center(child: Text("Start favoriting words to play!"))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.orange.shade200),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.lightbulb_outline,
                          size: 18,
                          color: Colors.orange.shade800,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "HINT: $currentHint",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange.shade900,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Unscramble the Word",
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Word ${currentIndex + 1} of ${words.length}",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Jumbled Letters View
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: theme.primaryColor.withValues(alpha: 0.1),
                      ),
                    ),
                    child: Text(
                      jumbledWord,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 32,
                        letterSpacing: 4,
                        fontWeight: FontWeight.w900,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Enter the correct word...",
                      filled: true,
                      fillColor: Colors.grey.withValues(alpha: 0.05),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.edit_note),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.arrow_circle_right, size: 32),
                        color: theme.primaryColor,
                        onPressed: _checkWord,
                      ),
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    onSubmitted: (_) => _checkWord(),
                  ),
                  const SizedBox(height: 30),
                  if (audioUrl != null)
                    TextButton.icon(
                      onPressed: _playAudio,
                      icon: const Icon(Icons.volume_up),
                      label: const Text("Need a hint? Listen to word"),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.orange.shade800,
                      ),
                    ),
                  const SizedBox(height: 40),
                  if (feedback != null)
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isCorrect
                            ? Colors.green.shade50
                            : Colors.red.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        feedback!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isCorrect
                              ? Colors.green.shade700
                              : Colors.red.shade700,
                        ),
                      ),
                    ),
                ],
              ),
            ),
    );
  }
}
