import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/weather_service.dart';
import '../bloc/weather_bloc.dart';
import '../bloc/weather_event.dart';
import '../bloc/weather_state.dart';
import '../models/weather_model.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previsão do tempo com BLoC'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // --- Campo de Busca ---
            const CitySearchField(),
            const SizedBox(height: 20),

            // --- Exibição do Clima ---
            // O BlocBuilder é o widget que ouve as mudanças de estado do WeatherBloc.
            Expanded(
              child: BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  // Com base no estado atual, decidimos qual widget mostrar.

                  // Estado Inicial
                  if (state is WeatherInitial) {
                    return const Center(
                      child: Text('Digite o nome da cidade para começar!'),
                    );
                  }

                  // Estado de Carregamento
                  if (state is WeatherLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // Estado de Sucesso
                  if (state is WeatherLoaded) {
                    return WeatherDisplay(weather: state.weather);
                  }

                  // Estado de Erro
                  if (state is WeatherError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }

                  // Estado padrão (nunca deve acontecer)
                  return const Center(child: Text('Algo deu errado =('));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget para o campo de busca
class CitySearchField extends StatelessWidget {
  const CitySearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Digite o nome da cidade',
        hintText: 'Ex: Florianópolis',
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            if (controller.text.isNotEmpty) {
              // Dispara o evento para o BLoC com o nome da cidade.
              context.read<WeatherBloc>().add(FetchWeather(controller.text));
            }
          },
        ),
        border: const OutlineInputBorder(),
      ),
      onSubmitted: (value) {
        if (value.isNotEmpty) {
          // Permite buscar também ao pressionar 'Enter' no teclado.
          context.read<WeatherBloc>().add(FetchWeather(value));
        }
      },
    );
  }
}

// Widget para exibir os dados do clima
class WeatherDisplay extends StatelessWidget {
  final Weather weather;
  const WeatherDisplay({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weather.cityName,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Image.network(WeatherService.getIconUrl(weather.iconCode)),
          const SizedBox(height: 10),
          Text(
            '${weather.temperature.toStringAsFixed(1)}°C',
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w200),
          ),
          const SizedBox(height: 10),
          Text(
            weather.description.substring(0, 1).toUpperCase() +
                weather.description.substring(1),
            style: const TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
