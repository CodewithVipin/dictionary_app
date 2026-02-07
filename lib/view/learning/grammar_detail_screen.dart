import 'package:flutter/material.dart';

class GrammarDetailScreen extends StatefulWidget {
  final Map<String, dynamic> topicData;

  const GrammarDetailScreen({super.key, required this.topicData});

  @override
  State<GrammarDetailScreen> createState() => _GrammarDetailScreenState();
}

class _GrammarDetailScreenState extends State<GrammarDetailScreen> {
  // Map to store selected answers for quiz questions
  // Key: Question Index, Value: Selected Option
  final Map<int, String> _userAnswers = {};
  bool _showResults = false;

  @override
  Widget build(BuildContext context) {
    final rules = widget.topicData['rules'] as List;
    final quiz = widget.topicData['quiz'] as List?;

    return Scaffold(
      appBar: AppBar(title: Text(widget.topicData['title'])),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Teaching Section
            _buildSectionHeader("Concept & Rules", Icons.menu_book),
            const SizedBox(height: 10),
            ...rules.map((r) => _buildRuleCard(r)),

            const SizedBox(height: 30),
            const Divider(thickness: 2),
            const SizedBox(height: 20),

            // Quiz Section
            if (quiz != null && quiz.isNotEmpty) ...[
              _buildSectionHeader("Practice Quiz", Icons.quiz),
              const SizedBox(height: 10),
              ...quiz.asMap().entries.map((entry) {
                return _buildQuizCard(entry.key, entry.value);
              }),
              const SizedBox(height: 20),
              if (!_showResults)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showResults = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.indigo,
                    ),
                    child: const Text(
                      "Check Answers",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              if (_showResults)
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Text(
                      "You got ${_calculateScore()} out of ${quiz.length} correct!",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
            ],
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  int _calculateScore() {
    int score = 0;
    final quiz = widget.topicData['quiz'] as List;
    for (int i = 0; i < quiz.length; i++) {
      if (_userAnswers[i] == quiz[i]['correctAnswer']) {
        score++;
      }
    }
    return score;
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.indigo, size: 28),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
      ],
    );
  }

  Widget _buildRuleCard(Map<String, dynamic> rule) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              rule['rule'],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              rule['hindiRule'],
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.shade100),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.lightbulb_outline,
                    size: 20,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Ex: ${rule['example']}",
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w500,
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

  Widget _buildQuizCard(int index, Map<String, dynamic> questionData) {
    final question = questionData['question'];
    final options = questionData['options'] as List;
    final correctAnswer = questionData['correctAnswer'];
    final selectedAnswer = _userAnswers[index];
    final isCorrect = selectedAnswer == correctAnswer;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Q${index + 1}. $question",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...options.map((option) {
              Color? optionColor;
              if (_showResults) {
                if (option == correctAnswer) {
                  optionColor = Colors.green.shade100;
                } else if (option == selectedAnswer && !isCorrect) {
                  optionColor = Colors.red.shade100;
                }
              } else if (option == selectedAnswer) {
                optionColor = Colors.indigo.shade50;
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: InkWell(
                  onTap: _showResults
                      ? null
                      : () {
                          setState(() {
                            _userAnswers[index] = option;
                          });
                        },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: optionColor ?? Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: _showResults
                            ? (option == correctAnswer
                                  ? Colors.green
                                  : (option == selectedAnswer
                                        ? Colors.red
                                        : Colors.grey.shade300))
                            : (option == selectedAnswer
                                  ? Colors.indigo
                                  : Colors.grey.shade300),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            option,
                            style: TextStyle(
                              fontSize: 15,
                              color: _showResults && option == correctAnswer
                                  ? Colors.green.shade800
                                  : Colors.black87,
                              fontWeight: option == selectedAnswer
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                        if (_showResults)
                          if (option == correctAnswer)
                            const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 20,
                            )
                          else if (option == selectedAnswer)
                            const Icon(
                              Icons.cancel,
                              color: Colors.red,
                              size: 20,
                            ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
