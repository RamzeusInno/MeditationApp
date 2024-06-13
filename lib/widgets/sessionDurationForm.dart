import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionDurationForm extends ConsumerStatefulWidget {
  @override
  ConsumerState<SessionDurationForm> createState() => _SessionDurationFormState();
}

class _SessionDurationFormState extends ConsumerState<SessionDurationForm> {
  final _formKey = GlobalKey<FormState>();
  int _minutes = 0;
  int _seconds = 10;
  int _repetitions = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Time of a period"),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: TextFormField(
                          initialValue: '0',
                          decoration: const InputDecoration(
                            labelText: 'Minutes',
                          ),
                          keyboardType: TextInputType.number,
                          onFieldSubmitted: (value) {
                            setState(() {
                              _minutes = int.parse(value);
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        flex: 1,
                        child: TextFormField(
                          initialValue: '10',
                          decoration: const InputDecoration(  
                            labelText: 'Seconds',
                          ),
                          keyboardType: TextInputType.number,
                          onFieldSubmitted: (value) {
                            setState(() {
                              _seconds = int.parse(value);
                            });
                          },
                        ),
                      ),
                  ]
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: TextFormField(
                      initialValue: '3',
                      decoration: const InputDecoration(
                        labelText: 'Number of repetitions',
                      ),
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (value) {
                        setState(() {
                          _repetitions = int.parse(value);
                        });
                      },
                    ),
                ),
                  const SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                          print('Session duration: ${_minutes}m ${_seconds}s');
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                ],
            ),
          ),
        ),
      ),
    );
  }
}