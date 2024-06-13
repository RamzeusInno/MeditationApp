import 'package:flutter/material.dart';
import 'package:contrast_shower_appplication/screens/homeScreen.dart';
import 'package:contrast_shower_appplication/screens/sessionScreen.dart';
import 'package:contrast_shower_appplication/screens/postSessionScreen.dart';
import 'package:contrast_shower_appplication/screens/sessionPreferencesScreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Homescreen(),
        '/session_preferences': (context) => const SessionPreferencesScreen(),
        
      },  
    ),
  ));
}

