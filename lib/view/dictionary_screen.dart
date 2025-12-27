import 'package:flutter/material.dart';
import 'package:dictionary_app/view/favorites_screen.dart';

import '../viewmodel/dictionary_viewmodel.dart';
import '../core/audio/audio_service.dart';
import '../core/api/suggestion_api.dart';
import '../core/storage/favorites_service.dart';

class DictionaryScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDark;

  const DictionaryScreen({
    super.key,
    required this.onToggleTheme,
    required this.isDark,
  });

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  final TextEditingController controller = TextEditingController();
  final DictionaryViewModel vm = DictionaryViewModel();

  bool isFavorite = false;

  List<String> suggestions = [];
  bool loadingSuggestions = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // 🔍 live typing handler
  Future<void> onTextChanged(String value) async {
    final query = value.trim();

    if (query.isEmpty) {
      if (mounted) {
        setState(() {
          suggestions.clear();
          loadingSuggestions = false;
        });
      }
      return;
    }

    if (mounted) {
      setState(() {
        loadingSuggestions = true;
      });
    }

    final result = await SuggestionApi.getSuggestions(query);

    if (!mounted) return;

    setState(() {
      suggestions = result;
      loadingSuggestions = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Coffee Dictionary"),
        actions: [
          IconButton(
            icon: Icon(widget.isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: widget.onToggleTheme,
          ),
          IconButton(
            icon: const Icon(Icons.star),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FavoritesScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSearchBar(context),

            if (loadingSuggestions)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: LinearProgressIndicator(),
              ),

            // 🔽 suggestions (height-limited, safe)
            if (suggestions.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(top: 8),
                constraints: const BoxConstraints(maxHeight: 220),
                child: Card(
                  child: ListView.builder(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemCount: suggestions.length,
                    itemBuilder: (context, index) {
                      final word = suggestions[index];

                      return ListTile(
                        title: Text(word),
                        onTap: () async {
                          // 1️⃣ update UI immediately
                          controller.text = word;
                          FocusScope.of(context).unfocus();
                          if (mounted) {
                            setState(() {
                              suggestions.clear();
                            });
                          }

                          // 2️⃣ fetch meaning
                          await vm.search(word);
                          final fav = await FavoritesService.isFavorite(word);

                          if (!mounted) return;

                          // 3️⃣ update UI + hide keyboard

                          setState(() {
                            isFavorite = fav;
                          });
                        },
                      );
                    },
                  ),
                ),
              ),

            const SizedBox(height: 12),

            if (vm.isLoading) const CircularProgressIndicator(),

            if (vm.error != null)
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  vm.error!,
                  style: TextStyle(color: Colors.red.shade300),
                ),
              ),

            if (vm.dictionary != null) Expanded(child: _buildResult(context)),
          ],
        ),
      ),
    );
  }

  // 🔎 SEARCH BAR
  Widget _buildSearchBar(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(14),
      child: TextField(
        controller: controller,
        onChanged: onTextChanged,
        decoration: InputDecoration(
          hintText: "Search a word…",
          prefixIcon: const Icon(Icons.search),
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    controller.clear();
                    FocusScope.of(context).requestFocus(FocusNode());
                    setState(() {
                      suggestions.clear();
                      // vm.dictionary = null;
                      vm.error = null;
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          filled: true,
        ),
        onSubmitted: (_) {
          // ❌ do NOT search on submit
          // just hide keyboard
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }

  // 📘 RESULT VIEW
  Widget _buildResult(BuildContext context) {
    final data = vm.dictionary!;

    return ListView(
      children: [
        // 🔹 WORD HEADER
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    data.word,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.star : Icons.star_border,
                    color: isFavorite ? Colors.amber : null,
                  ),
                  onPressed: () async {
                    await FavoritesService.toggleFavorite(data.word);
                    if (!mounted) return;
                    setState(() => isFavorite = !isFavorite);
                  },
                ),
                if (data.phonetics.isNotEmpty &&
                    data.phonetics.first['audio'] != "")
                  IconButton(
                    icon: const Icon(Icons.volume_up),
                    onPressed: () {
                      AudioService.play(data.phonetics.first['audio']);
                    },
                  ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 12),

        // 🔹 ALL PARTS OF SPEECH
        ...data.meanings.asMap().entries.map<Widget>((entry) {
          final index = entry.key;
          final meaning = entry.value;

          if (meaning is! Map ||
              meaning['definitions'] is! List ||
              (meaning['definitions'] as List).isEmpty) {
            return const SizedBox();
          }

          final definitions = meaning['definitions'] as List;

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🏷 PART OF SPEECH
                  Text(
                    meaning['partOfSpeech'] ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // 📘 ENGLISH DEFINITIONS (LIMITED)
                  ...definitions.take(2).map<Widget>((def) {
                    if (def is Map && def['definition'] != null) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Text("• ${def['definition']}"),
                      );
                    }
                    return const SizedBox();
                  }),

                  // 🇮🇳 HINDI MEANING (ONLY ON FIRST MEANING)
                  // 🇮🇳 Hindi meaning per section
                  if (vm.hindiLoadingIndexes.contains(index))
                    const Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: Text(
                        "हिंदी अर्थ लोड हो रहा है...",
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),

                  if (!vm.hindiLoadingIndexes.contains(index) &&
                      vm.hindiMeanings[index] != null &&
                      vm.hindiMeanings[index]!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        "हिंदी अर्थ: ${vm.hindiMeanings[index]}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          height: 1.4,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
