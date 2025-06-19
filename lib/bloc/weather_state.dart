import 'package:equatable/equatable.dart';
import '../models/weather_model.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

// Estado inicial, quando o app abre pela primeira vez.
class WeatherInitial extends WeatherState {}

// Estado de carregamento, quando estamos a buscar os dados da API.
class WeatherLoading extends WeatherState {}

// Estado de sucesso, quando os dados foram carregados.
// Ele carrega consigo os dados do clima.
class WeatherLoaded extends WeatherState {
  final Weather weather;

  const WeatherLoaded(this.weather);

  @override
  List<Object?> get props => [weather];
}

// Estado de erro, quando algo deu errado.
// Ele carrega consigo a mensagem de erro.
class WeatherError extends WeatherState {
  final String message;

  const WeatherError(this.message);

  @override
  List<Object?> get props => [message];
}
