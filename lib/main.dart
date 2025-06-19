import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'api/weather_service.dart';
import 'bloc/weather_bloc.dart';
import 'screens/weather_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App com BLoC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[900],
      ),
      // 1. Injetando o BLoC
      // O BlocProvider cria uma instância do WeatherBloc e a torna disponível
      // para todos os widgets filhos (neste caso, a WeatherScreen e seus filhos).
      home: BlocProvider(
        create: (context) => WeatherBloc(WeatherService()),
        child: const WeatherScreen(),
      ),
    );
  }
}
