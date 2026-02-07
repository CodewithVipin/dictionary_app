import 'package:flutter/material.dart';
import '../../core/data/idioms_data.dart';

class IdiomsScreen extends StatefulWidget {
  const IdiomsScreen({super.key});

  @override
  State<IdiomsScreen> createState() => _IdiomsScreenState();
}

class _IdiomsScreenState extends State<IdiomsScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> filteredIdioms = [];

  @override
  void initState() {
    super.initState();
    filteredIdioms = List.from(idiomsList);
  }

  void _filterIdioms(String query) {
    setState(() {
      filteredIdioms = idiomsList.where((item) {
        final idiom = item['idiom']!.toLowerCase();
        final meaning = item['meaning']!.toLowerCase();
        final hindi = item['hindi']!.toLowerCase();
        final searchLower = query.toLowerCase();
        return idiom.contains(searchLower) ||
            meaning.contains(searchLower) ||
            hindi.contains(searchLower);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Idioms & Phrases")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search idioms or meanings...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: theme.cardColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: _filterIdioms,
            ),
          ),
          Expanded(
            child: filteredIdioms.isEmpty
                ? const Center(child: Text("No idioms found."))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: filteredIdioms.length,
                    itemBuilder: (context, index) {
                      final item = filteredIdioms[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ExpansionTile(
                          title: Text(
                            item['idiom']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                          subtitle: Text(
                            item['meaning']!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Divider(),
                                  const SizedBox(height: 8),
                                  Text(
                                    "हिन्दी अर्थ:",
                                    style: theme.textTheme.titleSmall?.copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item['hindi']!,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    "Example Usage:",
                                    style: theme.textTheme.titleSmall?.copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: theme.primaryColor.withValues(
                                        alpha: 0.05,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withValues(
                                            alpha: 0.1,
                                          ),
                                          blurRadius: 4,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                      border: Border.all(
                                        color: theme.primaryColor.withValues(
                                          alpha: 0.1,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      "“${item['example']}”",
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic,
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
          ),
        ],
      ),
    );
  }
}
