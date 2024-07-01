import 'package:meditation_app/session.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/screens/homeScreen.dart';
import 'package:meditation_app/screens/sessionScreen.dart';
import 'package:meditation_app/screens/postSessionScreen.dart';
import 'package:meditation_app/screens/sessionPreferencesScreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditation_app/screens/sessionScreen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'widgets/meditation_app.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<String>('sessionBox');
  runApp(const ProviderScope(
    child: MeditationApp(),
  ));
}
