import 'package:contrast_shower_appplication/providers/colorProvider.dart';
import 'package:contrast_shower_appplication/providers/selectedSessionProvider.dart';
import 'package:contrast_shower_appplication/providers/sessionProvider.dart';
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
        int periodDuration = session.getPhaseDuration().inSeconds;
        if (dif % periodDuration == 0) {
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

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            timeDisplay(),
            startTimerButton(),
          ],
        ),
      ),
    );
  }
 
  Widget startTimerButton() {
    final bool timerIsRunning = timer != null && timer!.isActive;
    final bool timerIsCompleted = sessionDuration.inSeconds <= 0;

    return timerIsRunning || !timerIsCompleted && timer != null ?
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
            const SizedBox(width: 15),
            ElevatedButton(
              onPressed: () {
                addFinishedSession();
                Navigator.pushNamed(context, '/post');
              },
             child: const Text('End session'),
            )
        ],
        ),
      ) 
      :
     ElevatedButton(
      onPressed: () => startTimer(),
       child: const Text('Start timer'),
      );
  }

void addFinishedSession() {
  final finishedSessions = ref.watch(finishedSessionNotifierProvider.notifier);
  final Session session = ref.watch(selectedSessionNotifierProvider);

  Session finishedSession = Session.sessionAndPeriodDurationInit(session.getSessionDuration(), session.getPeriodDuration());
  finishedSessions.addSession(finishedSession);
}
  Widget timeDisplay() {
    final Session session = ref.watch(selectedSessionNotifierProvider);

    return SizedBox(
      width: 200,
      height: 200,

      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: 1 - sessionDuration.inSeconds / session.getSessionDuration().inSeconds,
            valueColor: AlwaysStoppedAnimation(Colors.green[400]),
            backgroundColor: Colors.white,
          ),
      
          Center(
            child: Text(
            '${sessionDuration.inMinutes.toString().padLeft(2, '0')}:${(sessionDuration.inSeconds % 60).toString().padLeft(2, '0')}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 70.0,
              ),
            ),
          )
          
        ],
      ),
    );
  }
}