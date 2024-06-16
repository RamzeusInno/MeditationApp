import 'package:flutter/material.dart';
import 'package:contrast_shower_appplication/screens/homeScreen.dart';
import 'package:contrast_shower_appplication/screens/sessionScreen.dart';
import 'package:contrast_shower_appplication/screens/postSessionScreen.dart';
import 'package:contrast_shower_appplication/screens/sessionPreferencesScreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contrast_shower_appplication/screens/sessionOverviewScreen.dart';
import 'package:contrast_shower_appplication/screens/sessionScreen.dart';


void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/session_preferences': (context) => const SessionPreferencesScreen(),
        '/session_overview': (context) => const SessionOverviewScreen(),
        '/session': (context) => const SessionScreen(),
        '/post_session': (context) => const PostSessionScreen(),
      },  
    ),
  ));
}

