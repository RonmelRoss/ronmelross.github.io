import 'package:flutter/material.dart';
import 'package:lab_one/pages/dashboard.dart';
import 'package:lab_one/pages/welcome_screen.dart';
import 'package:lab_one/pages/signup_screen.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';

// void main() => runApp(const SignUpApp());
void main() => runApp(
  ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: SignUpApp(),
    ),
);

class SignUpApp extends StatelessWidget {
  const SignUpApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const SignUpScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/dashboard': (context) => MyHomePage(),
      },
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    // print('clicked togglefavorite')
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }

    print('favorites: $favorites');
    notifyListeners();
  }
}