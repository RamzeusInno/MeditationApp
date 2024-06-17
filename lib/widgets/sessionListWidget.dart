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
        return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      
      child: ValueListenableBuilder(
        valueListenable: Hive.box<String>('sessionBox').listenable(),
        builder: (context, Box<String> box, widget) {
          List<String> sessions = box.values.toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (sessions.isNotEmpty) 
                const Text(
                'Custom Session List',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              
              const SizedBox(height: 10),

              ListView.builder(
                shrinkWrap: true,
                itemCount: sessions.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.fromLTRB(300, 0, 300, 0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300]
                    ),
                      child: Center(child: Text(
                        'Session number ${index + 1}\n${sessions[index]}',
                      ),
                    )
                  );
                },
              ),

            ],
          );
        },
      ),
    );
  }
}
