import 'package:flutter/material.dart';
import '../../core/data/news_data.dart';
import '../dictionary_screen.dart';

class NewsLearnScreen extends StatelessWidget {
  const NewsLearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("News-to-Learn")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: newsArticles.length,
        itemBuilder: (context, index) {
          final article = newsArticles[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 20),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue.shade700, Colors.blue.shade400],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article['date']!,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        article['title']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: _buildInteractiveContent(
                      context,
                      article['content']!,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  color: Colors.blue.shade50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.touch_app,
                        size: 18,
                        color: Colors.blue.shade700,
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          "Tap any word to see its dictionary meaning instantly!",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Widget> _buildInteractiveContent(BuildContext context, String content) {
    final words = content.split(' ');

    return words.map((word) {
      final cleanWord = word.replaceAll(RegExp(r'[^\w\s]'), '');

      return InkWell(
        onTap: () {
          if (cleanWord.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DictionaryScreen(
                  onToggleTheme: () {},
                  isDark: Theme.of(context).brightness == Brightness.dark,
                  initialWord: cleanWord,
                ),
              ),
            );
          }
        },
        child: Text(word, style: const TextStyle(fontSize: 16, height: 1.5)),
      );
    }).toList();
  }
}
