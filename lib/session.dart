class Session {
  final int _minutes;
  final int _seconds;
  final int _repetitions;

  Session(this._minutes, this._seconds, this._repetitions);

  Duration getPeriodDuration() {
    return Duration(minutes: _minutes, seconds: _seconds);
  }

  Duration getSessionDuration() {
    return getPeriodDuration() * _repetitions * 2; // multiply by 2 because of the two periods: hot and cold  
  }

  String formattedDuration(Duration duration) {
    return "${duration.inMinutes.toString().padLeft(2, '0')}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}";
  }

  String info() {
    String periodDuration = formattedDuration(getPeriodDuration());
    String sessioonDuration = formattedDuration(getSessionDuration());

    return "Period duration: $periodDuration\nRepetitions: $_repetitions\nOverall session duration: $sessioonDuration";
  }
}