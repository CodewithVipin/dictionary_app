// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../core/storage/favorites_service.dart';
import '../core/api/dictionary_api.dart';
import '../model/dictionary_model.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int? expandedIndex; // only one item open
  DictionaryModel? expandedWordData;
  bool loadingMeaning = false;
  Future<void> _confirmClearFavorites(BuildContext context) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Clear Favorites"),
        content: const Text(
          "Are you sure you want to remove all favorite words?\nThis action cannot be undone.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Clear"),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await FavoritesService.clearFavorites();
      setState(() {}); // refresh list
    }
  }

  Future<void> loadMeaning(String word, int index) async {
    // collapse if same item tapped again
    if (expandedIndex == index) {
      setState(() {
        expandedIndex = null;
        expandedWordData = null;
      });
      return;
    }

    setState(() {
      expandedIndex = index;
      loadingMeaning = true;
      expandedWordData = null;
    });

    final data = await DictionaryApi.getWord(word);

    if (data != null) {
      expandedWordData = DictionaryModel.fromJson(data);
    }

    loadingMeaning = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Words ⭐"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            tooltip: "Clear all favorites",
            onPressed: () => _confirmClearFavorites(context),
          ),
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: FavoritesService.getFavorites(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final favorites = snapshot.data!;

          if (favorites.isEmpty) {
            return const Center(child: Text("No favorites yet"));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final word = favorites[index];
              final isExpanded = expandedIndex == index;

              return Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: ListTile(
                      title: Text(
                        word,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                      ),
                      onTap: () => loadMeaning(word, index),
                    ),
                  ),

                  // 🔽 EXPANDED MEANING PANEL
                  if (isExpanded)
                    Container(
                      margin: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                        bottom: 12,
                      ),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor.withOpacity(0.95),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: loadingMeaning
                          ? const Center(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : expandedWordData == null
                          ? const Text("Meaning not found")
                          : _buildMeaning(expandedWordData!),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildMeaning(DictionaryModel data) {
    if (data.meanings.isEmpty) {
      return const Text("No meaning available");
    }

    final meaning = data.meanings.first;

    if (meaning['definitions'] is! List ||
        (meaning['definitions'] as List).isEmpty) {
      return const Text("No definition available");
    }

    final definition =
        (meaning['definitions'] as List).first['definition'] ?? '';

    // ✨ Clean one-line English meaning
    final shortMeaning = definition.replaceAll(RegExp(r'\s+'), ' ').trim();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          meaning['partOfSpeech'] ?? '',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),

        SizedBox(
          width: double.infinity,
          child: Text(
            shortMeaning,
            maxLines: 2, // one-line feel, safe wrap
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 15, height: 1.4),
          ),
        ),
      ],
    );
  }
}
