import 'package:flutter/material.dart';
import '../../core/api/dictionary_api.dart';
import '../../core/service/word_of_the_day_service.dart';
import '../../model/dictionary_model.dart';

class WotdHistoryScreen extends StatefulWidget {
  const WotdHistoryScreen({super.key});

  @override
  State<WotdHistoryScreen> createState() => _WotdHistoryScreenState();
}

class _WotdHistoryScreenState extends State<WotdHistoryScreen> {
  int? expandedIndex;
  DictionaryModel? expandedWordData;
  bool loadingMeaning = false;

  Future<void> loadMeaning(String word, int index) async {
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
      if (mounted) {
        setState(() {
          expandedWordData = DictionaryModel.fromJson(data);
        });
      }
    }

    if (mounted) {
      setState(() {
        loadingMeaning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Word of the Day History")),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: WordOfTheDayService.getHistory(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final history = snapshot.data!;

          if (history.isEmpty) {
            return const Center(
              child: Text("No history yet. check back tomorrow!"),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: history.length,
            itemBuilder: (context, index) {
              final item = history[index];
              final word = item['word'];
              final date = item['date'];
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
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        date,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      trailing: Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                      ),
                      onTap: () => loadMeaning(word, index),
                    ),
                  ),
                  if (isExpanded)
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor.withOpacity(0.95),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: loadingMeaning
                          ? const Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : expandedWordData == null
                          ? const Text("Definition not found")
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (expandedWordData!.meanings.isNotEmpty)
                                  Text(
                                    expandedWordData!
                                        .meanings
                                        .first['partOfSpeech'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                const SizedBox(height: 4),
                                if (expandedWordData!.meanings.isNotEmpty &&
                                    (expandedWordData!
                                                .meanings
                                                .first['definitions']
                                            as List)
                                        .isNotEmpty)
                                  Text(
                                    (expandedWordData!
                                                    .meanings
                                                    .first['definitions']
                                                as List)
                                            .first['definition'] ??
                                        '',
                                  ),
                              ],
                            ),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
