import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../viewmodel/dictionary_viewmodel.dart';
import '../core/audio/audio_service.dart';
import '../core/api/suggestion_api.dart';
import '../core/storage/favorites_service.dart';
import '../core/service/word_of_the_day_service.dart';
import '../core/storage/history_service.dart';
import '../core/storage/mastery_service.dart';
import 'app_drawer.dart';

class DictionaryScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDark;
  final String? initialWord;

  const DictionaryScreen({
    super.key,
    required this.onToggleTheme,
    required this.isDark,
    this.initialWord,
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
  List<String> recentSearches = [];
  Map<String, dynamic>? wotd;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (mounted) setState(() {});
    });
    _loadInitialData();
    if (widget.initialWord != null) {
      controller.text = widget.initialWord!;
      Future.microtask(() => _onSearch(widget.initialWord!));
    }
  }

  Future<void> _loadInitialData() async {
    final h = await HistoryService.getHistory();
    final w = await WordOfTheDayService.getWordOfTheDay();
    if (mounted) {
      setState(() {
        recentSearches = h;
        wotd = w;
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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

    if (mounted) setState(() => loadingSuggestions = true);
    final result = await SuggestionApi.getSuggestions(query);
    if (!mounted) return;
    setState(() {
      suggestions = result;
      loadingSuggestions = false;
    });
  }

  void _onSearch(String word) async {
    FocusScope.of(context).unfocus();
    controller.text = word;
    setState(() {
      suggestions.clear();
    });

    await vm.search(word);

    if (vm.dictionary != null) {
      await HistoryService.addSearch(word);
      await MasteryService.recordInteraction(word);
      final h = await HistoryService.getHistory();
      final fav = await FavoritesService.isFavorite(word);
      if (mounted) {
        setState(() {
          recentSearches = h;
          isFavorite = fav;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("My Dictionary"),
        actions: [
          IconButton(
            icon: Icon(widget.isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: widget.onToggleTheme,
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

            // Suggestions
            if (suggestions.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(top: 8),
                constraints: const BoxConstraints(maxHeight: 220),
                child: Card(
                  child: ListView.builder(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemCount: suggestions.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(suggestions[index]),
                      onTap: () => _onSearch(suggestions[index]),
                    ),
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

            // Content
            if (vm.dictionary != null)
              Expanded(child: _buildResult(context))
            else if (!vm.isLoading)
              Expanded(child: _buildHomeContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeContent() {
    return ListView(
      children: [
        if (wotd != null) ...[_buildWotdCard(), const SizedBox(height: 24)],
        if (recentSearches.isNotEmpty) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Recent Searches",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () async {
                  await HistoryService.clearHistory();
                  setState(() => recentSearches = []);
                },
                child: const Text("Clear"),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...recentSearches
              .take(5)
              .map(
                (word) => ListTile(
                  leading: const Icon(
                    Icons.history,
                    size: 20,
                    color: Colors.grey,
                  ),
                  title: Text(word),
                  contentPadding: EdgeInsets.zero,
                  onTap: () => _onSearch(word),
                ),
              ),
        ],
      ],
    );
  }

  Widget _buildWotdCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Colors.green.shade700, Colors.green.shade500],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "WORD OF THE DAY",
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              wotd!['word'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              wotd!['hindi'] ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _onSearch(wotd!['word']),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.green.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("View Details"),
            ),
          ],
        ),
      ),
    );
  }

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
                    FocusScope.of(context).unfocus();
                    setState(() {
                      suggestions.clear();
                      vm.error = null;
                      // Don't clear result, user might want to see history
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
        onSubmitted: (val) {
          if (val.trim().isNotEmpty) _onSearch(val.trim());
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.word,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      if (vm.transliteration != null &&
                          vm.transliteration!.isNotEmpty)
                        Text(
                          "(${vm.transliteration})",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade600,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.star : Icons.star_border,
                    color: isFavorite ? Colors.amber : null,
                  ),
                  onPressed: () async {
                    await FavoritesService.toggleFavorite(
                      data.word,
                      data: data.toJson(),
                    );
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // 📘 ENGLISH DEFINITIONS (LIMITED)
                  ...definitions.take(3).map<Widget>((def) {
                    if (def is Map && def['definition'] != null) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Text(
                          "• ${def['definition']}",
                          style: const TextStyle(fontSize: 16),
                        ),
                      );
                    }
                    return const SizedBox();
                  }),

                  // 🇮🇳 HINDI MEANING (ONLY ON FIRST MEANING)
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
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "हिंदी अर्थ: ${vm.hindiMeanings[index]}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.copy,
                              size: 18,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              final text =
                                  "Word: ${data.word}\nDefinition: ${vm.hindiMeanings[index]}";
                              Clipboard.setData(ClipboardData(text: text));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Hindi meaning copied!"),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          );
        }),

        // 🔸 EXAMPLES
        if (data.examples.isNotEmpty)
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Examples",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...data.examples.map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        "“$e”",
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        // 🔹 SYNONYMS & ANTONYMS
        if (data.synonyms.isNotEmpty || data.antonyms.isNotEmpty)
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (data.synonyms.isNotEmpty) ...[
                    Text(
                      "Synonyms",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Wrap(
                      spacing: 8,
                      children: data.synonyms
                          .map(
                            (s) => Chip(
                              label: Text(s),
                              backgroundColor: Theme.of(
                                context,
                              ).primaryColor.withValues(alpha: 0.3),
                              labelStyle: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 12),
                  ],

                  if (data.antonyms.isNotEmpty) ...[
                    Text(
                      "Antonyms",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Wrap(
                      spacing: 8,
                      children: data.antonyms
                          .map(
                            (a) => Chip(
                              label: Text(a),
                              backgroundColor: Colors.red.shade50,
                              labelStyle: TextStyle(color: Colors.red.shade700),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ],
              ),
            ),
          ),
      ],
    );
  }
}
