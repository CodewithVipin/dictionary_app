import 'package:flutter/material.dart';
import 'dart:math';
import '../../core/data/word_bank_data.dart';

class FlashcardsScreen extends StatefulWidget {
  const FlashcardsScreen({super.key});

  @override
  State<FlashcardsScreen> createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends State<FlashcardsScreen> {
  List<Map<String, String>> cards = [];
  int currentIndex = 0;
  bool showFront = true;

  @override
  void initState() {
    super.initState();
    // Flatten all word banks for flashcards
    for (var list in wordBanks.values) {
      cards.addAll(list);
    }
    cards.shuffle();
  }

  void _nextCard() {
    setState(() {
      currentIndex = (currentIndex + 1) % cards.length;
      showFront = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (cards.isEmpty) {
      return const Scaffold(body: Center(child: Text("No cards available")));
    }

    final item = cards[currentIndex];

    return Scaffold(
      appBar: AppBar(title: const Text("Flashcards")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: InkWell(
                onTap: () => setState(() => showFront = !showFront),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                        final rotate = Tween(
                          begin: pi,
                          end: 0.0,
                        ).animate(animation);
                        return AnimatedBuilder(
                          animation: rotate,
                          child: child,
                          builder: (context, child) {
                            final isUnder = (ValueKey(showFront) != child!.key);
                            var tilt =
                                ((animation.value - 0.5).abs() - 0.5) * 0.003;
                            tilt *= isUnder ? -1.0 : 1.0;
                            final rotationValue = isUnder
                                ? min(rotate.value, pi / 2)
                                : rotate.value;
                            return Transform(
                              transform: Matrix4.rotationY(rotationValue)
                                ..setEntry(3, 0, tilt),
                              alignment: Alignment.center,
                              child: child,
                            );
                          },
                        );
                      },
                  child: showFront
                      ? _buildCardFace(
                          item['word']!,
                          "Tap to see meaning",
                          true,
                        )
                      : _buildCardFace(item['hindi']!, item['example']!, false),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _nextCard,
                  icon: const Icon(Icons.refresh),
                  label: const Text("Shuffle/Next"),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardFace(String mainText, String subText, bool isFront) {
    return Card(
      key: ValueKey(isFront),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      color: isFront ? Colors.white : Colors.blue.shade50,
      child: Container(
        height: 350,
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFront ? "WORD" : "MEANING",
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const Spacer(),
            Text(
              mainText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: isFront ? Colors.blue.shade800 : Colors.green.shade800,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              subText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
            const Spacer(),
            const Icon(Icons.touch_app, color: Colors.grey, size: 20),
          ],
        ),
      ),
    );
  }
}
