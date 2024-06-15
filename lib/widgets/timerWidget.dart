import 'package:contrast_shower_appplication/providers/selectedSessionProvider.dart';
import 'package:contrast_shower_appplication/session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';


class Timerwidget extends ConsumerStatefulWidget {
  const Timerwidget({super.key});

  @override
  ConsumerState<Timerwidget> createState() => _TimerwidgetState();
}

class _TimerwidgetState extends ConsumerState<Timerwidget> {
  late Duration sessionDuration;
  bool sessionDurationInitialized = false;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_){
      setState(() => sessionDuration -= const Duration(seconds: 1));
    }
    );
  }
  

  @override
  Widget build(BuildContext context) {
    if (!sessionDurationInitialized) {
      final Session session = ref.watch(selectedSessionNotifierProvider);
      sessionDuration = session.getSessionDuration();
      sessionDurationInitialized = true;
    }

    return Column(
      children: [
        timeDisplay(),
        startTimerButton(),
      ],
    );
  }
 
  Widget startTimerButton() {
    return ElevatedButton(
      onPressed: () => startTimer(),
       child: const Text('Start timer'),
      );
  }

  Widget timeDisplay() {
    return Text(
      '${sessionDuration.inMinutes.toString().padLeft(2, '0')}:${(sessionDuration.inSeconds % 60).toString().padLeft(2, '0')}',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 70.0,
      ),
    );
  }
}