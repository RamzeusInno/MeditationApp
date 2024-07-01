import 'package:contrast_shower_appplication/providers/theme_provider.dart';
import 'package:contrast_shower_appplication/session.dart';
import 'package:flutter/material.dart';
import 'package:contrast_shower_appplication/screens/homeScreen.dart';
import 'package:contrast_shower_appplication/screens/sessionScreen.dart';
import 'package:contrast_shower_appplication/screens/postSessionScreen.dart';
import 'package:contrast_shower_appplication/screens/sessionPreferencesScreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contrast_shower_appplication/screens/sessionScreen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
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
