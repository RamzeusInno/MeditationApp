import 'package:contrast_shower_appplication/session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SessionNotifier extends Notifier<List<Session>> {
  @override
  List<Session> build() {
    return [];
  }

  void addSession(Session session) {
    state = [...state, session];
  }

  void removeSession(Session session) {
    state = state.where((element) => element != session).toList();
  }
}


final upcomingSessionNotifierProvider = NotifierProvider<SessionNotifier, List<Session>>(() {
  return SessionNotifier();
});

final finishedSessionNotifierProvider = NotifierProvider<SessionNotifier, List<Session>>(() {
  return SessionNotifier();
});