import 'package:contrast_shower_appplication/providers/selectedSessionProvider.dart';
import 'package:contrast_shower_appplication/session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contrast_shower_appplication/widgets/timerWidget.dart';


class SessionScreen extends ConsumerStatefulWidget {
  const SessionScreen({super.key});

  @override
  ConsumerState<SessionScreen> createState() => _SessionscreenState();
}

class _SessionscreenState extends ConsumerState<SessionScreen> {
  @override
  Widget build(BuildContext context) {
    final session = ref.watch(selectedSessionNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contrast shower session"),
        backgroundColor: Colors.blue[900],
      ),
      body: const Center(
        child: Timerwidget(),
      ),
    );
  }
}