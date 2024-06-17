import 'package:contrast_shower_appplication/widgets/sessionListWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contrast shower app"),
        backgroundColor: Colors.blue[900],
      ),
      body: Container(
        margin: const EdgeInsets.all(64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/session_preferences');
              },
              child: const Text("Start new session")
              ),
              const SessionListWidget(),
          ]
        ),
      ),
    );
  }
}


