import 'package:flutter/material.dart';
import 'dart:async';
import '../../core/audio/audio_service.dart';

class PronunciationCoachScreen extends StatefulWidget {
  const PronunciationCoachScreen({super.key});

  @override
  State<PronunciationCoachScreen> createState() =>
      _PronunciationCoachScreenState();
}

class _PronunciationCoachScreenState extends State<PronunciationCoachScreen>
    with SingleTickerProviderStateMixin {
  final List<Map<String, String>> _words = [
    {
      'word': 'Phenomenon',
      'phonetic': '/fəˈnɒm.ɪ.nən/',
      'hindi': 'घटना',
      'audio':
          'https://api.dictionaryapi.dev/media/pronunciations/en/phenomenon-us.mp3',
    },
    {
      'word': 'Colonel',
      'phonetic': '/ˈkɜː.nəl/',
      'hindi': 'कर्नल',
      'audio':
          'https://api.dictionaryapi.dev/media/pronunciations/en/colonel-us.mp3',
    },
    {
      'word': 'Anemone',
      'phonetic': '/əˈnem.ə.ni/',
      'hindi': 'एनीमोन (एक फूल)',
      'audio':
          'https://api.dictionaryapi.dev/media/pronunciations/en/anemone-us.mp3',
    },
    {
      'word': 'Mischievous',
      'phonetic': '/ˈmɪs.tʃɪ.vəs/',
      'hindi': 'शरारती',
      'audio':
          'https://api.dictionaryapi.dev/media/pronunciations/en/mischievous-us.mp3',
    },
    {
      'word': 'Quinoa',
      'phonetic': '/ˈkiːn.wɑː/',
      'hindi': 'क्विनोआ',
      'audio':
          'https://api.dictionaryapi.dev/media/pronunciations/en/quinoa-us.mp3',
    },
  ];

  int _currentIndex = 0;
  bool _isRecording = false;
  double? _accuracyScore;
  double _animationValue = 0;
  Timer? _animationTimer;

  void _startRecording() {
    setState(() {
      _isRecording = true;
      _accuracyScore = null;
    });

    // Simulate voice levels animation
    _animationTimer = Timer.periodic(const Duration(milliseconds: 100), (
      timer,
    ) {
      if (mounted) {
        setState(() => _animationValue = (timer.tick % 10) / 10.0);
      }
    });

    // Simulate analysis after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isRecording = false;
          _animationTimer?.cancel();
          _accuracyScore =
              0.7 + (0.25 * (DateTime.now().millisecond % 10) / 10); // 70-95%
        });
      }
    });
  }

  @override
  void dispose() {
    _animationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final current = _words[_currentIndex];
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Pronunciation Coach")),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  const Text(
                    "Master the tricky words!",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  const SizedBox(height: 40),
                  _buildWordCard(current, theme),
                  const SizedBox(height: 60),
                  _buildCoachFeedback(),
                ],
              ),
            ),
          ),
          _buildControls(theme),
        ],
      ),
    );
  }

  Widget _buildWordCard(Map<String, String> item, ThemeData theme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            item['word']!,
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w900,
              color: theme.brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item['phonetic']!,
            style: TextStyle(
              fontSize: 20,
              color: theme.primaryColor,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            item['hindi']!,
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 30),
          IconButton.filled(
            onPressed: () {
              if (item['audio'] != null) {
                AudioService.play(item['audio']!);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Audio not available for this word"),
                  ),
                );
              }
            },
            icon: const Icon(Icons.volume_up, size: 32),
            style: IconButton.styleFrom(
              backgroundColor: theme.primaryColor.withValues(alpha: 0.1),
              foregroundColor: theme.primaryColor,
              padding: const EdgeInsets.all(20),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Listen to Sample",
            style: TextStyle(fontSize: 12, color: theme.primaryColor),
          ),
        ],
      ),
    );
  }

  Widget _buildCoachFeedback() {
    if (_isRecording) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                width: 10,
                height:
                    20 +
                    (index == 2 ? 40 * _animationValue : 20 * _animationValue),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(5),
                ),
              );
            }),
          ),
          const SizedBox(height: 16),
          const Text(
            "Listening to you...",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      );
    }

    if (_accuracyScore != null) {
      bool isGreat = _accuracyScore! > 0.85;
      return Column(
        children: [
          Text(
            isGreat ? "Fantastic! 🌟" : "Good Attempt! 👍",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isGreat ? Colors.green : Colors.orange,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Accuracy: ", style: TextStyle(fontSize: 18)),
              Text(
                "${(_accuracyScore! * 100).toInt()}%",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 200,
            child: LinearProgressIndicator(
              value: _accuracyScore,
              backgroundColor: Colors.grey.shade200,
              color: isGreat ? Colors.green : Colors.orange,
              minHeight: 10,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ],
      );
    }

    return const Text(
      "Tap the Mic to start your practice",
      style: TextStyle(color: Colors.grey),
    );
  }

  Widget _buildControls(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                _currentIndex =
                    (_currentIndex - 1 + _words.length) % _words.length;
                _accuracyScore = null;
              });
            },
            icon: const Icon(Icons.skip_previous),
          ),
          GestureDetector(
            onTap: _isRecording ? null : _startRecording,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: _isRecording ? Colors.red : theme.primaryColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: (_isRecording ? Colors.red : theme.primaryColor)
                        .withValues(alpha: 0.3),
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Icon(
                _isRecording ? Icons.mic : Icons.mic_none,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _currentIndex = (_currentIndex + 1) % _words.length;
                _accuracyScore = null;
              });
            },
            icon: const Icon(Icons.skip_next),
          ),
        ],
      ),
    );
  }
}
