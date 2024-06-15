import 'package:contrast_shower_appplication/providers/colorProvider.dart';
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
    final Session session = ref.watch(selectedSessionNotifierProvider);
    final colorNotifier = ref.read(colorNotifierProvider.notifier);

    timer = Timer.periodic(const Duration(seconds: 1), (_){
      setState(() {
        if (sessionDuration.inSeconds <= 0) {
          colorNotifier.setColor(Colors.white);
          timer?.cancel();
          return;
        }

        int dif = session.getSessionDuration().inSeconds - sessionDuration.inSeconds;
        int periodDuration = session.getPeriodDuration().inSeconds;
        if (dif % periodDuration == 0) {
          print("$dif - $periodDuration - ${dif % (periodDuration * 2)}");

          if (dif % (2 * periodDuration) == 0) {
            colorNotifier.setColor(Colors.blue);
          } else {
            colorNotifier.setColor(Colors.red);
          }
        }

        sessionDuration -= const Duration(seconds: 1);
      });
    }
    );
  }
  

  @override
  Widget build(BuildContext context) {
    final Session session = ref.watch(selectedSessionNotifierProvider);

    if (!sessionDurationInitialized) {
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
    final bool timerIsRunning = timer != null && timer!.isActive;
    final bool timerIsCompleted = sessionDuration.inSeconds <= 0;

    return timerIsRunning || !timerIsCompleted && timer != null ?
     Row(
      children: [
        ElevatedButton(
          onPressed: () {
            if (timerIsRunning) { 
              setState(() => timer?.cancel());
            } else {
              startTimer();
            }
          },
           child: timerIsRunning ? const Text('Pause') : const Text('Resume'),
          ),
      ],
     ):
     ElevatedButton(
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