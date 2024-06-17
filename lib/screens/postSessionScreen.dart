import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contrast_shower_appplication/widgets/sessionSummaryWidget.dart';


class PostSessionScreen extends ConsumerStatefulWidget {
  const PostSessionScreen({super.key});

  @override
  ConsumerState<PostSessionScreen> createState() => _PostSessionScreenState();
}

class _PostSessionScreenState extends ConsumerState<PostSessionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Session Summary"),
        backgroundColor: Colors.blue[900],
      ),
      body: Center(
        child: Center(
          child: Column(
            children: [
               const SessionSummaryWidget(),
               ElevatedButton(
                 onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },              
                child: const Text('Main screen'),
               ),
            ],
          )
        )
      ),
    );
  }
}
