import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/weather_service.dart';
import '../models/weather_model.dart';
import 'weather_state.dart';
import 'weather_event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherService weatherService;

  WeatherBloc(this.weatherService) : super(WeatherInitial()) {
    // Aqui registamos o "manipulador" para o evento FetchWeather.
    on<FetchWeather>(_onFetchWeather);
  }

  // Esta função é chamada sempre que um evento FetchWeather é adicionado ao BLoC.
  Future<void> _onFetchWeather(
    FetchWeather event,
    Emitter<WeatherState> emit,
  ) async {
    try {
      // 1. Emite o estado de carregamento para a UI mostrar um spinner.
      emit(WeatherLoading());

      // 2. Chama o nosso serviço para buscar os dados do clima.
      final Weather weather = await weatherService.getWeather(event.cityName);

      // 3. Emite o estado de sucesso com os dados do clima.
      emit(WeatherLoaded(weather));
    } catch (e) {
      // 4. Emite o estado de erro se algo der errado.
      emit(WeatherError(e.toString()));
    }
  }
}
