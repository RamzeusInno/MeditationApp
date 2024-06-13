import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class Homescreen extends ConsumerStatefulWidget {
  const Homescreen({super.key});

  @override
  ConsumerState<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends ConsumerState<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contrast shower app"),
        backgroundColor: Colors.blue[900],
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/session_preferences');
            },
            child: const Text("Start session")
            ),
      ),
      // TODO: Add previous session display
    );
  }
}
