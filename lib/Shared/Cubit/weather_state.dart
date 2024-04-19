part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}

class WeatherInitial extends WeatherState {}

class determinePositionState extends WeatherState {}

class determineLastKnownLocationState extends WeatherState {}

class getPositionStreamState extends WeatherState {}

class getResponseLoadingState extends WeatherState {}

class getResponseSucessState extends WeatherState {}

class getResponseErrorState extends WeatherState {
  final error;
  getResponseErrorState(this.error);
}
