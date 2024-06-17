import 'package:contrast_shower_appplication/providers/sessionProvider.dart';
import 'package:contrast_shower_appplication/session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contrast_shower_appplication/providers/selectedSessionProvider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class SessionListWidget extends ConsumerStatefulWidget {
  const SessionListWidget({super.key});

  @override
  ConsumerState<SessionListWidget> createState() => _SessionListWidgetState();
}

class _SessionListWidgetState extends ConsumerState<SessionListWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<String>('sessionBox').listenable(),
      builder: (context, Box<String> box, widget) {
        List<String> sessions = box.values.toList();

        return Expanded (
          child: SizedBox(
            height: 200.0,
            child: ListView.builder(
              itemCount: sessions.length,
              itemBuilder: (context, index) {
                return ListTile(  
                title: Text(sessions[index]),
              );
              },
            ),
          ),
        );
      },
    );
  }
}
