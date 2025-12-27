import 'package:flutter/material.dart';
import 'view/dictionary_screen.dart';

void main() {
  runApp(const DictionaryApp());
}

class DictionaryApp extends StatefulWidget {
  const DictionaryApp({super.key});

  @override
  State<DictionaryApp> createState() => _DictionaryAppState();
}

class _DictionaryAppState extends State<DictionaryApp> {
  bool isDark = false;

  void toggleTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee Dictionary',
      theme: isDark ? coffeeDarkTheme : coffeeLightTheme,
      home: DictionaryScreen(onToggleTheme: toggleTheme, isDark: isDark),
    );
  }
}

final ThemeData coffeeLightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFFF6EFEA),
  primaryColor: const Color(0xFF6F4E37),
  cardColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF6F4E37),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(fontSize: 16),
  ),
);

final ThemeData coffeeDarkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF1E1B18),
  primaryColor: const Color(0xFFB08968),
  cardColor: const Color(0xFF2A2521),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF2A2521),
    foregroundColor: Color(0xFFF3ECDC),
    elevation: 0,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(fontSize: 16),
  ),
);
