import 'package:flutter/material.dart';
import 'quiz_screen.dart';
import 'spelling_bee_screen.dart';
import 'spell_checker_screen.dart';
import 'idioms_screen.dart';
import 'word_bank_screen.dart';
import 'flashcards_screen.dart';
import 'one_word_screen.dart';
import 'root_words_screen.dart';
import 'grammar_guide_screen.dart';
import 'news_learn_screen.dart';
import 'study_material_screen.dart';
import 'visual_vocab_screen.dart';
import 'mastery_dashboard_screen.dart';
import 'pronunciation_coach_screen.dart';
import 'offline_manager_screen.dart';
import '../app_drawer.dart';

class LearnHubScreen extends StatelessWidget {
  const LearnHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<LearnItem> items = [
      LearnItem(
        title: "Offline Mode",
        subtitle: "No Internet? OK",
        icon: Icons.offline_bolt,
        color: Colors.green,
        screen: const OfflineManagerScreen(),
      ),
      LearnItem(
        title: "Pronunciation",
        subtitle: "Speak correctly",
        icon: Icons.record_voice_over,
        color: Colors.redAccent,
        screen: const PronunciationCoachScreen(),
      ),
      LearnItem(
        title: "Mastery Tracker",
        subtitle: "Learning Insights",
        icon: Icons.analytics,
        color: Colors.indigo,
        screen: const MasteryDashboardScreen(),
      ),
      LearnItem(
        title: "Visual Vocab",
        subtitle: "See & Learn",
        icon: Icons.auto_awesome,
        color: Colors.amber,
        screen: const VisualVocabScreen(),
      ),
      LearnItem(
        title: "Daily Quiz",
        subtitle: "Test your knowledge",
        icon: Icons.quiz,
        color: Colors.blue,
        screen: const QuizScreen(),
      ),
      LearnItem(
        title: "One-Word",
        subtitle: "100+ Substitutions",
        icon: Icons.abc,
        color: Colors.indigo,
        screen: const OneWordScreen(),
      ),
      LearnItem(
        title: "Root Words",
        subtitle: "Latin & Greek roots",
        icon: Icons.account_tree,
        color: Colors.teal,
        screen: const RootWordsScreen(),
      ),
      LearnItem(
        title: "Word Banks",
        subtitle: "Exam-wise vocabulary",
        icon: Icons.account_balance,
        color: Colors.brown,
        screen: const WordBankScreen(),
      ),
      LearnItem(
        title: "Grammar Guide",
        subtitle: "100 Golden Rules",
        icon: Icons.g_translate,
        color: Colors.deepOrange,
        screen: const GrammarGuideScreen(),
      ),
      LearnItem(
        title: "Flashcards",
        subtitle: "Swipe & memorize",
        icon: Icons.style,
        color: Colors.deepPurple,
        screen: const FlashcardsScreen(),
      ),
      LearnItem(
        title: "News Learning",
        subtitle: "Daily Context",
        icon: Icons.newspaper,
        color: Colors.blueGrey,
        screen: const NewsLearnScreen(),
      ),
      LearnItem(
        title: "Study Material",
        subtitle: "PDF & Exports",
        icon: Icons.picture_as_pdf,
        color: Colors.red,
        screen: const StudyMaterialScreen(),
      ),
      LearnItem(
        title: "Jumbled Word",
        subtitle: "Unscramble letters",
        icon: Icons.extension,
        color: Colors.orange,
        screen: const SpellingBeeScreen(),
      ),
      LearnItem(
        title: "Spell Checker",
        subtitle: "Verify your spelling",
        icon: Icons.spellcheck,
        color: Colors.teal,
        screen: const SpellCheckerScreen(),
      ),
      LearnItem(
        title: "Idioms & Phrases",
        subtitle: "Native expressions",
        icon: Icons.menu_book,
        color: Colors.purple,
        screen: const IdiomsScreen(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Learn Hub")),
      drawer: const AppDrawer(),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final theme = Theme.of(context);
          return Container(
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => item.screen),
                  );
                },
                borderRadius: BorderRadius.circular(24),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: item.color.withValues(alpha: 0.15),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: item.color.withValues(alpha: 0.2),
                            width: 1,
                          ),
                        ),
                        child: Icon(item.icon, size: 36, color: item.color),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        item.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          color: theme.brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item.subtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                          color: theme.brightness == Brightness.dark
                              ? Colors.white60
                              : Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class LearnItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Widget screen;

  LearnItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.screen,
  });
}
