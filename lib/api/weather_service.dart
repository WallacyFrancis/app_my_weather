import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/weather_model.dart';

class WeatherService {
  static const String _baseUrl =
      'https://api.openweathermap.org/data/2.5/weather';

  Future<Weather> getWeather(String cityName) async {
    final apiKey = dotenv.env['OPENWEATHER_API_KEY'];

    if (apiKey == null) {
      throw Exception('Chave de api não encontrada no arquivo .env');
    }

    final response = await http.get(
      Uri.parse('$_baseUrl?q=$cityName&appid=$apiKey&units=metric&lang=pt_br'),
    );

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception('Cidade não encontrada!');
    } else {
      throw Exception('Erro ao buscar dados do clima!');
    }
  }

  static String getIconUrl(String iconCode) {
    return 'https://openweathermap.org/img/wn/$iconCode@4x.png';
  }
}
