import 'package:meditation_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/screens/home_screen.dart';
import 'package:meditation_app/screens/session_screen.dart';
import 'package:meditation_app/screens/post_session_screen.dart';
import 'package:meditation_app/screens/session_preferences_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../themes/dark_theme.dart';
import '../themes/light_theme.dart';

class MeditationApp extends ConsumerStatefulWidget {
  const MeditationApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MeditationApp();
}

class _MeditationApp extends ConsumerState<MeditationApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ref.watch(themeProvider),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/session_preferences': (context) => const SessionPreferencesScreen(),
        '/session': (context) => const SessionScreen(),
        '/post_session': (context) => const PostSessionScreen(),
      },
    );
  }
}
