import 'package:contrast_shower_appplication/session.dart';
import 'package:flutter/material.dart';
import 'package:contrast_shower_appplication/screens/homeScreen.dart';
import 'package:contrast_shower_appplication/screens/sessionScreen.dart';
import 'package:contrast_shower_appplication/screens/postSessionScreen.dart';
import 'package:contrast_shower_appplication/screens/sessionPreferencesScreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contrast_shower_appplication/screens/sessionOverviewScreen.dart';
import 'package:contrast_shower_appplication/screens/sessionScreen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';


void main() async {
  await Hive.initFlutter();
  await Hive.openBox<String>('sessionBox');

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

