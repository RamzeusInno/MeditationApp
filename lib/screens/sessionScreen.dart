import 'package:contrast_shower_appplication/widgets/default_app_bar.dart';
import 'package:contrast_shower_appplication/widgets/homeButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contrast_shower_appplication/widgets/timerWidget.dart';
import 'dart:async';
import 'audio_player.dart';
import 'package:contrast_shower_appplication/providers/selected_song_provider.dart';



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
          appBar: DefaultAppBar(title: "Meditation", ref: ref),
          body: Container(
            child: const Timerwidget(),
          ),
        );
      },
    );
  }
}