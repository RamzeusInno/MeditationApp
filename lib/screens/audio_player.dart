import 'package:just_audio/just_audio.dart';

class AudioPlayerManager {
  late AudioPlayer _audioPlayer;

  Future<void> init() async {
    _audioPlayer = AudioPlayer();
  }

Future<void> playAudio(String selectedSongPath) async {
  await _audioPlayer.setUrl(selectedSongPath);
  await _audioPlayer.play();
}


  Future<void> stopAudio() async {
    await _audioPlayer.stop();
  }

  Future<void> dispose() async {
    await _audioPlayer.dispose();
  }
}
