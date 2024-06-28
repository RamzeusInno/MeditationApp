import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contrast_shower_appplication/providers/selected_song_provider.dart';

class SongSelectionWidget extends ConsumerStatefulWidget {
  const SongSelectionWidget({super.key});

  @override
  ConsumerState<SongSelectionWidget> createState() => _SongSelectionWidgetState();
}

class _SongSelectionWidgetState extends ConsumerState<SongSelectionWidget> {
  int _selectedSongIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Choose a song:"),
        ...List.generate(
          3,
          (index) => RadioListTile<int>(
            title: Text("Song ${index + 1}"),
            value: index,
            groupValue: _selectedSongIndex,
            onChanged: (value) {
              setState(() {
                _selectedSongIndex = value!;
                ref.read(selectedSongProvider.notifier).state = getSongPath(index + 1);
              });
            },
          ),
        ),
      ],
    );
  }

  String getSongPath(int songNumber) {
    switch (songNumber) {
      case 1:
        return 'audio/sea_sound.mp3'; 
      case 2:
        return 'audio/birds.mp3'; 
      case 3:
        return 'audio/waterfall.mp3'; 
      default:
        throw ArgumentError('Invalid song number: $songNumber');
    }
  }
}
