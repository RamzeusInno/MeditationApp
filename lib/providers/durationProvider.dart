import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DurationNotifier extends Notifier<Duration> {
  @override
  Duration build() {
    return const Duration(minutes: 0, seconds: 0);
  }

  void setDuration(Duration duration) {
    state = duration;
  }
}


final durationNotifierProvider = NotifierProvider<DurationNotifier, Duration>((){
  return DurationNotifier();
});