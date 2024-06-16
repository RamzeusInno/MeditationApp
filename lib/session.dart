class Session {
  final int _minutes;
  final int _seconds;
  final int _repetitions;

  Session(this._minutes, this._seconds, this._repetitions);

  Session.sessionAndPeriodDurationInit(Duration sessionDuration, Duration periodDuration) :
    _minutes = sessionDuration.inMinutes,
    _seconds = sessionDuration.inSeconds.remainder(60),
    _repetitions = sessionDuration.inSeconds ~/ periodDuration.inSeconds;

  Session.phaseDurationInit(Duration phaseDuration, this._repetitions) :
    _minutes = phaseDuration.inMinutes,
    _seconds = phaseDuration.inSeconds.remainder(60);

  Duration getPhaseDuration() {
    return Duration(minutes: _minutes, seconds: _seconds);
  }

  Duration getPeriodDuration() {
    return getPhaseDuration() * 2;// multiply by 2 because of the two periods: hot and cold 
  }

  Duration getSessionDuration() {
    return getPeriodDuration() * _repetitions;  
  }

  String formattedDuration(Duration duration) {
    return "${duration.inMinutes.toString().padLeft(2, '0')}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}";
  }

  String info() {
    String phaseDuration = formattedDuration(getPhaseDuration());
    String periodDuration = formattedDuration(getPeriodDuration());
    String sessioonDuration = formattedDuration(getSessionDuration());

    return "Phase duration: $phaseDuration\nPeriod duration: $periodDuration\nRepetitions: $_repetitions\nOverall session duration: $sessioonDuration";
  }
}