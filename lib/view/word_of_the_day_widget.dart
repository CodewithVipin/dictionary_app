import 'package:flutter/material.dart';
import '../../core/api/dictionary_api.dart';
import '../../model/dictionary_model.dart';
import '../../core/service/word_of_the_day_service.dart';

class WordOfTheDayDialog extends StatefulWidget {
  final String word;
  final VoidCallback onDismiss;

  const WordOfTheDayDialog({
    super.key,
    required this.word,
    required this.onDismiss,
  });

  @override
  State<WordOfTheDayDialog> createState() => _WordOfTheDayDialogState();
}

class _WordOfTheDayDialogState extends State<WordOfTheDayDialog> {
  DictionaryModel? data;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
    WordOfTheDayService.markAsShown();
  }

  Future<void> _loadData() async {
    final raw = await DictionaryApi.getWord(widget.word);
    if (raw != null) {
      if (mounted) {
        setState(() {
          data = DictionaryModel.fromJson(raw);
          loading = false;
        });
      }
    } else {
      if (mounted) setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Column(
        children: [
          const Text(
            "Word of the Day 📅",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Text(
            widget.word,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
      content: loading
          ? const SizedBox(
              height: 100,
              child: Center(child: CircularProgressIndicator()),
            )
          : data == null
          ? const Text("Definition not found.")
          : SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Phonetic
                  if (data!.phonetics.isNotEmpty &&
                      data!.phonetics.first['text'] != null)
                    Center(
                      child: Text(
                        data!.phonetics.first['text'],
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                  const SizedBox(height: 16),

                  // Meaning
                  if (data!.meanings.isNotEmpty)
                    ...data!.meanings.take(1).map((m) {
                      final defs = m['definitions'] as List;
                      final def = defs.isNotEmpty
                          ? defs.first['definition']
                          : '';
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            m['partOfSpeech'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(def),
                        ],
                      );
                    }),

                  const SizedBox(height: 16),
                  // Example if available
                  if (data!.examples.isNotEmpty)
                    Text(
                      "“${data!.examples.first}”",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                ],
              ),
            ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            widget.onDismiss();
          },
          child: const Text("Close"),
        ),
        ElevatedButton(
          onPressed: () {
            // Dismiss and maybe open details? For now just dismiss
            Navigator.of(context).pop();
            widget.onDismiss();
          },
          child: const Text("Got it!"),
        ),
      ],
    );
  }
}
