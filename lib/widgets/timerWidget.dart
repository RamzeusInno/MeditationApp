import 'package:contrast_shower_appplication/providers/colorProvider.dart';
import 'package:contrast_shower_appplication/providers/ratingProvider.dart';
import 'package:contrast_shower_appplication/providers/selectedSessionProvider.dart';
import 'package:contrast_shower_appplication/providers/selected_song_provider.dart';
import 'package:contrast_shower_appplication/providers/sessionProvider.dart';
import 'package:contrast_shower_appplication/screens/audio_player.dart';
import 'package:contrast_shower_appplication/session.dart';
import 'package:contrast_shower_appplication/widgets/ratingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import 'package:hive/hive.dart';


class Timerwidget extends ConsumerStatefulWidget {
  const Timerwidget({super.key});

  @override
  ConsumerState<Timerwidget> createState() => _TimerwidgetState();
}

class _TimerwidgetState extends ConsumerState<Timerwidget> {
  late Duration sessionDuration;
  late Duration phaseDuration;
  bool sessionDurationInitialized = false;
  Timer? timer;
  late Box<String> box;
  final AudioPlayerManager audioPlayerManager = AudioPlayerManager();

  @override
  void initState() {
    super.initState();
    box = Hive.box<String>('sessionBox');
    initializeAudioPlayer();
  }

  Future<void> initializeAudioPlayer() async {
    await audioPlayerManager.init();
    if (mounted) {
      setState(() {});
    }
  }

  void startTimer() {
    final Session session = ref.watch(selectedSessionNotifierProvider);
    final colorNotifier = ref.read(colorNotifierProvider.notifier);

    timer = Timer.periodic(const Duration(seconds: 1), (_){
      setState(() {
        if (sessionDuration.inSeconds <= 0) {
          endSession();
          colorNotifier.setColor(Colors.white);
          return;
        }

        if (phaseDuration.inSeconds <= 0) {
          phaseDuration = session.getPhaseDuration();
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
        phaseDuration -= const Duration(seconds: 1);
      });
    }
    );
  }
  

  @override
  Widget build(BuildContext context) {
    final Session session = ref.watch(selectedSessionNotifierProvider);

    if (!sessionDurationInitialized) {
      sessionDuration = session.getSessionDuration();
      phaseDuration = session.getPhaseDuration();
      sessionDurationInitialized = true;
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text("Session Timer", style: TextStyle(fontSize: 20),),
            mainTimerDisplay(),
            const SizedBox(height: 20),
            const Text("Phase Timer", style: TextStyle(fontSize: 20),),
            phaseTimerDisplay(),
            startTimerButton(),
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
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
                audioPlayerManager.stopAudio();
              } else {
                startTimer();
                audioPlayerManager.resumeAudio();
              }
            },
              child: timerIsRunning ? const Text('Pause') : const Text('Resume'),
            ),
            const SizedBox(width: 15),
            ElevatedButton(
              onPressed: () {
                endSession();
              },
             child: const Text('End session'),
            )
        ],
        ),
      ) 
      :
     Padding(
       padding: const EdgeInsets.all(24.0),
       child: ElevatedButton(
        onPressed: () => {playAudio(), startTimer()},
         child: const Text('Start timer'),
        ),
     );
  }

  void playAudio() {
    final selectedSongPath = ref.watch(selectedSongProvider);
    audioPlayerManager.playAudio(selectedSongPath);
  }

void endSession() async {
  setState(() => timer?.cancel()); 
  audioPlayerManager.stopAudio();
  audioPlayerManager.dispose();

  await showDialog(context: context, builder: (BuildContext context) {
    return RatingDialog();
  });

  addFinishedSession();
  Navigator.pushNamed(context, '/post_session');
}

void addFinishedSession() {
  final finishedSessions = ref.watch(finishedSessionNotifierProvider.notifier);
  final session = ref.watch(selectedSessionNotifierProvider);
  final rating = ref.watch(ratingNotifierProvider);

  Session finishedSession = Session.sessionAndPeriodDurationInit(session.getSessionDuration() - sessionDuration, session.getPeriodDuration());
  finishedSessions.addSession(finishedSession);
  
  box.add(
      'Time: ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now())}\n'
      'Session time: ${Session.formattedDuration(finishedSession.getSessionDuration())}\n'
      'Task completion rate: ${(
        (finishedSession.getSessionDuration().inSeconds / session.getSessionDuration().inSeconds) * 100
        ).toStringAsFixed(0)}%\n'
      'Rating: ${rating == '' ? 'No rating' : '$rating/5'}'
    );
}
  Widget mainTimerDisplay() {
    final Session session = ref.watch(selectedSessionNotifierProvider);

    return SizedBox(
      width: 220,
      height: 220,

      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: 1 - sessionDuration.inSeconds / session.getSessionDuration().inSeconds,
            valueColor: AlwaysStoppedAnimation(Colors.green[500]),
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

  Widget phaseTimerDisplay() {
    final Session session = ref.watch(selectedSessionNotifierProvider);

    return SizedBox(
      width: 200,
      height: 200,

      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: 1 - phaseDuration.inSeconds / session.getPhaseDuration().inSeconds,
            valueColor: AlwaysStoppedAnimation(Colors.green[300]),
            backgroundColor: Colors.white,
          ),
      
          Center(
            child: Text(
            '${phaseDuration.inMinutes.toString().padLeft(2, '0')}:${(phaseDuration.inSeconds % 60).toString().padLeft(2, '0')}',
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