import 'package:contrast_shower_appplication/providers/colorProvider.dart';
import 'package:contrast_shower_appplication/widgets/homeButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contrast_shower_appplication/widgets/timerWidget.dart';
import 'dart:async';


class SessionScreen extends ConsumerStatefulWidget {
  const SessionScreen({super.key});

  @override
  ConsumerState<SessionScreen> createState() => _SessionscreenState();
}

class _SessionscreenState extends ConsumerState<SessionScreen> {
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        Color colorNotifier = ref.watch(colorNotifierProvider);
        
        return Scaffold(
          appBar: AppBar(
            actions: const [
              HomeButtonWidget(),
            ],
            title: const Text("Contrast shower session"),
            backgroundColor: Colors.blue[900],
          ),
          body: Container(
            color: colorNotifier,
            child: const Timerwidget(),
          ),
        );
      },
    );
  }
}