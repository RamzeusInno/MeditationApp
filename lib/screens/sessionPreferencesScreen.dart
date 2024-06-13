import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contrast_shower_appplication/widgets/sessionDurationForm.dart';


class SessionPreferencesScreen extends ConsumerStatefulWidget {
  const SessionPreferencesScreen({super.key});

  @override
  ConsumerState<SessionPreferencesScreen> createState() => _sessionPreferencesScreenState();
}

class _sessionPreferencesScreenState extends ConsumerState<SessionPreferencesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Session preferences"),
        backgroundColor: Colors.blue[900],
      ),
      body: SessionDurationForm()
    );
  }
}