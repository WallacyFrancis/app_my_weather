# Meu Clima - App Flutter

Um aplicativo de previsão do tempo desenvolvido em Flutter usando a arquitetura BLoC e a API do OpenWeatherMap.

## 🚀 Funcionalidades

- Busca de clima por cidade
- Interface moderna e responsiva
- Dados em português brasileiro
- Informações detalhadas (temperatura, umidade, velocidade do vento)
- Ícones dinâmicos baseados nas condições climáticas
- Tratamento de erros
- Arquitetura BLoC para gerenciamento de estado

## 📁 Estrutura do Projeto

```
lib/
├── main.dart                 # Ponto de entrada da aplicação
├── api/
│   └── weather_service.dart  # Lógica da API de clima
├── models/
│   └── weather_model.dart    # Modelo de dados do clima
├── bloc/                     # Pasta dedicada para toda a lógica BLoC
│   ├── weather_bloc.dart
│   ├── weather_event.dart
│   └── weather_state.dart
└── screens/
    └── weather_screen.dart   # Tela principal do app
```

## 🛠️ Configuração

### Pré-requisitos

- Flutter SDK (versão 3.8.1 ou superior)
- Dart SDK
- Uma conta no OpenWeatherMap para obter a API key

### Instalação

1. Clone o repositório:
```bash
git clone <url-do-repositorio>
cd app_my_weather
```

2. Instale as dependências:
```bash
flutter pub get
```

3. Configure a API Key:
   - Crie um arquivo `.env` na raiz do projeto
   - Adicione sua API key do OpenWeatherMap:
   ```
   OPENWEATHER_API_KEY=SUA_API_KEY_AQUI
   ```
   - Obtenha sua API key gratuita em: https://openweathermap.org/api

4. Execute o aplicativo:
```bash
flutter run
```

## 📦 Dependências

- `flutter_bloc`: Gerenciamento de estado
- `equatable`: Comparação de objetos
- `http`: Requisições HTTP
- `flutter_dotenv`: Gerenciamento de variáveis de ambiente

## 🎨 Interface

O aplicativo possui uma interface moderna com:
- Gradiente azul como tema principal
- Cards com sombras e bordas arredondadas
- Ícones dinâmicos do OpenWeatherMap
- Layout responsivo e intuitivo

## 🔧 Arquitetura

O projeto utiliza a arquitetura BLoC (Business Logic Component) para:
- Separação clara entre lógica de negócio e interface
- Gerenciamento de estado reativo
- Facilidade de teste e manutenção

## 📱 Como Usar

1. Abra o aplicativo
2. Digite o nome de uma cidade no campo de busca
3. Pressione Enter ou clique no ícone de busca
4. Visualize as informações climáticas detalhadas

## 🤝 Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para:
- Reportar bugs
- Sugerir novas funcionalidades
- Enviar pull requests

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.
