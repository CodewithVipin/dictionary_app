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
      theme: isDark ? greenDarkTheme : greenLightTheme,
      home: DictionaryScreen(onToggleTheme: toggleTheme, isDark: isDark),
    );
  }
}

final ThemeData greenLightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFFF1F8E9), // Light Green 50
  primaryColor: const Color(0xFF2E7D32), // Green 800
  cardColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF2E7D32),
    foregroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1B5E20),
    ),
    bodyMedium: TextStyle(fontSize: 16, color: Color(0xFF1B5E20)),
  ),
  iconTheme: const IconThemeData(color: Color(0xFF2E7D32)),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.green,
  ).copyWith(secondary: const Color(0xFF81C784)),
);

final ThemeData greenDarkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF1B5E20), // Green 900
  primaryColor: const Color(0xFF81C784), // Green 300
  cardColor: const Color(0xFF2E7D32), // Green 800
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1B5E20),
    foregroundColor: Color(0xFFE8F5E9),
    elevation: 0,
    iconTheme: IconThemeData(color: Color(0xFFE8F5E9)),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: Color(0xFFE8F5E9),
    ),
    bodyMedium: TextStyle(fontSize: 16, color: Color(0xFFE8F5E9)),
  ),
  iconTheme: const IconThemeData(color: Color(0xFF81C784)),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.green,
    brightness: Brightness.dark,
  ).copyWith(secondary: const Color(0xFF2E7D32)),
);
