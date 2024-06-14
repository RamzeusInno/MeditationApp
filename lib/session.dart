class Session {
  final int _minutes;
  final int _seconds;
  final int _repetitions;

  Session(this._minutes, this._seconds, this._repetitions);

  String getDuration() {
    final Duration duration = Duration(minutes: _minutes * _repetitions, seconds: _seconds * _repetitions);
    return "${duration.inMinutes}:${duration.inSeconds % 60}";
  }

  String info() {
    return "Minutes: $_minutes\nSeconds: $_seconds\nRepetitions: $_repetitions\nOverall duration: ${getDuration()}";
  }
}