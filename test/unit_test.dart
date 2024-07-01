import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_app/session.dart';



void main() {
  test('Session returns correct number of periods', () {
    // Arrange
    Session session = Session(const Duration(seconds: 30), 3);

    // Act
    int numberOfPeriods = session.numberOfPeriods();

    // Assert 
    expect(numberOfPeriods, 3);
  });

  test('Session returns correct number of phases', () {
    // Arrange
    Session session = Session(const Duration(seconds: 20), 3);

    // Act
    int numberOfPhases = session.numberOfPhases();

    // Assert 
    expect(numberOfPhases, 6);
  });

  test('Session returns correct phase duration', () {
    // Arrange
    Session session = Session(const Duration(seconds: 19), 3);

    // Act
    int phaseDuration = session.getPhaseDuration().inSeconds;

    // Assert 
    expect(phaseDuration, 9);
  });

  test('Session returns correct period duration', () {
    // Arrange
    Session session = Session(const Duration(seconds: 19), 3);

    // Act
    int periodDuration = session.getPeriodDuration().inSeconds;

    // Assert 
    expect(periodDuration, 19);
  });

  test('Session returns correct session duration', () {
    // Arrange
    Session session = Session(const Duration(seconds: 19), 3);

    // Act
    int sessionDuration = session.getSessionDuration().inSeconds;

    // Assert 
    expect(sessionDuration, 57);
  });
}