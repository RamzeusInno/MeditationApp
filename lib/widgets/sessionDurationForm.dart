import 'package:contrast_shower_appplication/session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contrast_shower_appplication/providers/selectedSessionProvider.dart';

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
          child: sessionPreferences(),
        ),
      ),
    );
  }

  Expanded sessionPreferences() {
    return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Time of a period"),
              periodDuration(),
              Flexible(
                flex: 1,
                child: repetitionsForm(),
              ),
                const SizedBox(width: 10),
                submitButton(),
              ],
          ),
        );
  }

  TextFormField repetitionsForm() {
    return TextFormField(
      initialValue: '3',
      decoration: const InputDecoration(
        labelText: 'Number of repetitions',
      ),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        setState(() {
          _repetitions = int.parse(value);
        });
      },
    );
  }

  Padding submitButton() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.validate() == true) {
            Session session = Session(
              _minutes,
              _seconds,
              _repetitions,
            );

            ref.read(selectedSessionNotifierProvider.notifier).setSession(session);
            Navigator.pushNamed(context, '/session_overview');
          }
        },
        child: Text('Submit'),
      ),
    );
  }

  Padding periodDuration() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: minutesForm(),
          ),
          const SizedBox(width: 10),
          Flexible(
            flex: 1,
            child: secondsForm(),
          ),
      ]
      ),
    );
  }

  TextFormField secondsForm() {
    return TextFormField(
      initialValue: '10',
      decoration: const InputDecoration(  
        labelText: 'Seconds',
      ),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        setState(() {
          _seconds = int.parse(value);
        });
      },
    );
  }

  TextFormField minutesForm() {
    return TextFormField(
      initialValue: '0',
      decoration: const InputDecoration(
        labelText: 'Minutes',
      ),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        setState(() {
          _minutes = int.parse(value);
        });
      },
    );
  }
}