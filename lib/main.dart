import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'widgets/meditation_app.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<String>('sessionBox');
  runApp(const ProviderScope(
    child: MeditationApp(),
  ));
}
