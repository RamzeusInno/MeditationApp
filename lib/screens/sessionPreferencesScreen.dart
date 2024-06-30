import 'package:contrast_shower_appplication/providers/theme_provider.dart';
import 'package:contrast_shower_appplication/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contrast_shower_appplication/widgets/sessionDurationForm.dart';
import 'package:contrast_shower_appplication/widgets/song_selection_widget.dart';


class SessionPreferencesScreen extends ConsumerStatefulWidget {
  const SessionPreferencesScreen({super.key});

  @override
  ConsumerState<SessionPreferencesScreen> createState() => _sessionPreferencesScreenState();
}

class _sessionPreferencesScreenState extends ConsumerState<SessionPreferencesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: "Start New Meditation", ref: ref),
      body: Column(
        children: [
          Expanded(
            child: SessionDurationForm(),
          ),
          SongSelectionWidget(),
        ],
      ),
    );
  }
}