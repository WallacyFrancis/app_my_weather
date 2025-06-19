import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/weather_model.dart';

class WeatherService {
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5';

  String get _apiKey {
    return dotenv.env['OPENWEATHER_API_KEY'] ?? 'SUA_API_KEY_AQUI';
  }

  Future<WeatherModel> getWeatherByCity(String city) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$_baseUrl/weather?q=$city&appid=$_apiKey&units=metric&lang=pt_br',
        ),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return WeatherModel.fromJson(data);
      } else {
        throw Exception(
          'Falha ao carregar dados do clima: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Erro na conexão: $e');
    }
  }

  Future<WeatherModel> getWeatherByLocation(double lat, double lon) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$_baseUrl/weather?lat=$lat&lon=$lon&appid=$_apiKey&units=metric&lang=pt_br',
        ),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return WeatherModel.fromJson(data);
      } else {
        throw Exception(
          'Falha ao carregar dados do clima: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Erro na conexão: $e');
    }
  }
}
