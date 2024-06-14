import 'package:contrast_shower_appplication/providers/selectedSessionProvider.dart';
import 'package:contrast_shower_appplication/session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionOverviewScreen extends ConsumerWidget {
  const SessionOverviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSession = ref.watch(selectedSessionNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Session overview"),
        backgroundColor: Colors.blue[900],
      ),
      body: Text(
        selectedSession.info(),
      ),
    );
  }
}