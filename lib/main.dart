import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joke_flutter_app/core/init.dart';
import 'package:joke_flutter_app/core/theme/app_theme.dart';
import 'package:joke_flutter_app/feature/joke/view/joke_screen.dart';

void main() {
  Init.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joke App',
      theme: AppTheme.theme,
      home: ProviderScope(child: const JokeScreen()),
    );
  }
}
