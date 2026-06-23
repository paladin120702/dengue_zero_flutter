# Dengue Zero

Aplicativo móvel desenvolvido em Flutter para o registro e acompanhamento de denúncias de possíveis focos de dengue. O usuário pode reportar um foco informando título, foto e localização no mapa, além de visualizar suas próprias denúncias.

## Funcionalidades

- Autenticação de usuários via Firebase Auth e login com conta Google
- Cadastro de denúncias com foto (câmera/galeria) e localização geográfica
- Seleção de localização e visualização em mapa (Google Maps)
- Upload de imagens para o Firebase Storage
- Listagem das denúncias do usuário ("Minhas denúncias")

## Tecnologias e dependências

### Plataforma
- **Flutter** (SDK Dart `>=2.17.0 <4.0.0`)
- **Dart**

### Backend / Serviços
- **Firebase Core** (`firebase_core`) — inicialização dos serviços Firebase
- **Firebase Auth** (`firebase_auth`) — autenticação de usuários
- **Google Sign In** (`google_sign_in`) — login com conta Google
- **Firebase Storage** (`firebase_storage`) — armazenamento das imagens das denúncias

### Mapas e localização
- **Google Maps Flutter** (`google_maps_flutter`) — exibição e seleção em mapa
- **Location** (`location`) — obtenção da localização do dispositivo

### Mídia e arquivos
- **Image Picker** (`image_picker`) — captura/seleção de imagens
- **Path Provider** (`path_provider`) e **Path** (`path`) — manipulação de caminhos de arquivos

### Estado e utilidades
- **Provider** (`provider`) — gerenciamento de estado (padrão MVVM)
- **HTTP** (`http`) — requisições de rede
- **Shared Preferences** (`shared_preferences`) — armazenamento local
- **Intl** (`intl`) — internacionalização e formatação
- **Cupertino Icons** (`cupertino_icons`)

### Desenvolvimento
- **Flutter Lints** (`flutter_lints`) — regras de boas práticas de código

## Arquitetura

O projeto segue o padrão **MVVM** com **Provider**, organizado em camadas:

```
lib/
├── main.dart                 # Ponto de entrada e injeção de dependências
├── firebase_options.dart     # Configuração gerada do Firebase
├── models/
│   ├── entities/             # Modelos de domínio (Denounces, PlaceLocation)
│   ├── exception/            # Exceções customizadas
│   ├── repositories/         # Repositórios (auth, denounces)
│   └── services/             # Serviços externos (Firebase Storage, Google Maps, local storage)
├── ui/
│   ├── core/themes/          # Temas da aplicação
│   ├── login/                # Tela e ViewModel de login
│   ├── home/                 # Tela inicial / overview
│   ├── new_complaint/        # Tela e ViewModel de nova denúncia
│   └── my_complaints/        # Tela e ViewModel de minhas denúncias
└── utils/                    # Configurações e rotas (app_config, app_routes)
```

## Como executar

Pré-requisitos: [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado e um projeto Firebase configurado.

```bash
# Instalar as dependências
flutter pub get

# Executar o aplicativo
flutter run
```

### Configuração do Firebase

Este projeto utiliza Firebase. É necessário ter o arquivo `lib/firebase_options.dart` configurado (gerado pela [FlutterFire CLI](https://firebase.google.com/docs/flutter/setup)) e os arquivos de plataforma correspondentes (`google-services.json` para Android e `GoogleService-Info.plist` para iOS).

Para o Google Maps, configure a chave de API nas plataformas Android e iOS.
