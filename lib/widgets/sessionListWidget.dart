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
                itemExtent: 80,
                itemBuilder: (context, index) {
                  if ((index < (sessions.length - 5)) && sessions.length > 5) {return Container();}
                  else {
                     return Container(
                      margin: const EdgeInsets.all(8),
                      constraints: const BoxConstraints.tightFor(
                        width: double.minPositive,
                        height: double.minPositive,
                      ),
                      decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300]
                    ),
                      child: Center(child: Text(
                        'Session number ${
                          (sessions.length <= 5) ? index + 1 : index + 1 - sessions.length - 5
                        }\n${sessions[index]}',
                        ),
                      )
                    );
                  }
                }
              ),

            ],
          );
        },
      ),
    );
  }
}
