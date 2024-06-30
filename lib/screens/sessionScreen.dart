import 'package:meditation_app/widgets/homeButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditation_app/widgets/timerWidget.dart';
import 'dart:async';
import 'audio_player.dart';
import 'package:meditation_app/providers/selected_song_provider.dart';



class SessionScreen extends ConsumerStatefulWidget {
  const SessionScreen({super.key});

  @override
  ConsumerState<SessionScreen> createState() => _SessionscreenState();
}

class _SessionscreenState extends ConsumerState<SessionScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {        
        return Scaffold(
          appBar: AppBar(
            actions: const [
              HomeButtonWidget(),
            ],
            title: const Text(
              "Meditation session",
              style: TextStyle(
              color: Colors.white,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 3.0,
                  color: Colors.black,
                ),
              ],
          ),
              ),
            backgroundColor: Colors.blue[900],
          ),
          body: Container(
            color: Colors.white,
            child: const Timerwidget(),
          ),
        );
      },
    );
  }
}