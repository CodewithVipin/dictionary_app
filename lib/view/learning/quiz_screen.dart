import 'package:flutter/material.dart';
import '../../core/service/quiz_service.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<QuizQuestion> questions = [];
  int currentQuestionIndex = 0;
  int score = 0;
  bool isFinished = false;
  bool isLoading = true;
  String? selectedOption;
  bool? isCorrect;

  @override
  void initState() {
    super.initState();
    _loadQuiz();
  }

  Future<void> _loadQuiz() async {
    if (!mounted) return;
    setState(() => isLoading = true);

    try {
      final q = await QuizService.generateQuiz();
      if (mounted) {
        setState(() {
          questions = q;
          isLoading = false;
          currentQuestionIndex = 0;
          score = 0;
          isFinished = false;
          selectedOption = null;
          isCorrect = null;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoading = false;
          questions = [];
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error loading quiz: $e")));
      }
    }
  }

  void _submitAnswer(String option) {
    if (selectedOption != null) return;

    final correct = questions[currentQuestionIndex].correctAnswer;
    setState(() {
      selectedOption = option;
      isCorrect = option == correct;
      if (isCorrect!) score++;
    });
  }

  void _nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedOption = null;
        isCorrect = null;
      });
    } else {
      setState(() {
        isFinished = true;
      });
    }
  }

  void _skipQuestion() {
    if (selectedOption != null) return;

    _nextQuestion();
  }

  void _abortQuiz() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Abort Quiz?"),
        content: const Text(
          "Are you sure you want to end the quiz now? Your current score will be shown.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() => isFinished = true);
            },
            child: const Text("Abort", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Quiz"),
        actions: [
          if (!isLoading && !isFinished && questions.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: _abortQuiz,
              tooltip: "Abort Quiz",
            ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : questions.isEmpty
          ? _buildEmptyState(theme)
          : isFinished
          ? _buildResultView(theme)
          : _buildQuizView(theme),
    );
  }

  Widget _buildEmptyState(ThemeData theme) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.quiz_outlined, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text(
              "No questions available right now.",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: _loadQuiz, child: const Text("Retry")),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizView(ThemeData theme) {
    final q = questions[currentQuestionIndex];

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              backgroundColor: theme.primaryColor.withValues(alpha: 0.1),
              valueColor: AlwaysStoppedAnimation<Color>(theme.primaryColor),
            ),
            const SizedBox(height: 20),
            Text(
              "Question ${currentQuestionIndex + 1} of ${questions.length}",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            Text(
              "Choose the correct meaning for:",
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Text(
              q.word,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.primaryColor,
              ),
            ),
            const SizedBox(height: 30),
            ...q.options.map((option) {
              Color? tileColor;
              bool isDisabled = selectedOption != null;

              if (isDisabled) {
                if (option == q.correctAnswer) {
                  tileColor = Colors.green.shade100;
                } else if (option == selectedOption && !isCorrect!) {
                  tileColor = Colors.red.shade100;
                }
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Material(
                  color: tileColor ?? theme.cardColor,
                  borderRadius: BorderRadius.circular(12),
                  elevation: isDisabled ? 0 : 2,
                  child: InkWell(
                    onTap: isDisabled ? null : () => _submitAnswer(option),
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 20,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              option,
                              style: TextStyle(
                                fontSize: 16,
                                color:
                                    isDisabled &&
                                        option != q.correctAnswer &&
                                        option != selectedOption
                                    ? Colors.grey
                                    : null,
                              ),
                            ),
                          ),
                          if (isDisabled)
                            Icon(
                              option == q.correctAnswer
                                  ? Icons.check_circle
                                  : (option == selectedOption
                                        ? Icons.cancel
                                        : null),
                              color: option == q.correctAnswer
                                  ? Colors.green
                                  : Colors.red,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 20),
            if (selectedOption != null) ...[
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: theme.primaryColor.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: theme.primaryColor.withValues(alpha: 0.1),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.info_outline,
                          size: 20,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Word Details",
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    if (q.hindi != null && q.hindi!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "हिन्दी: ${q.hindi}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    if (q.example != null && q.example!.isNotEmpty)
                      Text(
                        "Example: “${q.example}”",
                        style: const TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.black87,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _nextQuestion,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: theme.primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ] else
              OutlinedButton.icon(
                onPressed: _skipQuestion,
                icon: const Icon(Icons.skip_next),
                label: const Text("Skip Question"),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultView(ThemeData theme) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.stars, size: 80, color: Colors.amber),
            const SizedBox(height: 24),
            Text("Quiz Completed!", style: theme.textTheme.headlineMedium),
            const SizedBox(height: 12),
            Text(
              "Your Score: $score / ${questions.length}",
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _loadQuiz,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Try Again"),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Back to Home"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
