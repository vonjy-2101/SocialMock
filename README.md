# Documentation - SocialMock

## 1. Vue d'Ensemble de l'Architecture

### Architecture Clean Multicouche
```
📁 Projet
├── 📁 lib
│   ├── 📁 core           # Composants transversaux
│   │       └── 📁 di # dépendance injection
│   │           └── 📄 app_module.dart # dépendance injection
│   ├── 📁 domain         # Logique métier
│   │   ├── 📄 entities   # Modèles de données
│   │   └── 📄 repositories # Interfaces de repository
│   ├── 📁 data           # Gestion des données
│   │   ├── 📄 datasources # Sources de données
│   │   └── 📄 repositories # Implémentations
│   └── 📁 presentation   # Couche interface utilisateur
│       ├── 📄 providers  # Gestion d'état
│       └── 📄 screens    # Écrans de l'application
└── 📁 test               # Tests unitaires et d'intégration
```

## 2. Description des Couches

### 2.1 Domain Layer
- **Responsabilité** : Définir les règles métier et les entités
- **Composants** :
  - `PostEntity` (Entité Post)
  - `UserEntity` (Entité User)
  - `CommentEntity` (Entité Commentaire)
  - Interfaces de repositories

### 2.2 Data Layer
- **Responsabilité** : Gestion des sources de données
- **Composants** :
  - `PostApiService` (Gestion des requêtes API pour Post)
  - `UserApiService` (Gestion des requêtes API pour User)
  - `CommentApiService` (Gestion des requêtes API pour Comment)
  - Implémentation des repositories

### 2.3 Presentation Layer
- **Responsabilité** : Gestion de l'UI et de l'état
- **Composants** :
  - `PostProvider` (Gestion d'état avec Provider(Post))
  - Écrans (`PostScreen`,`CommentScreen`)

## 3. Gestion des Dépendances

### 3.1 Injection de Dépendances
- Utilisation d'une approche personnalisée avec `AppModule` et `AppDependencies`
- Configuration centralisée des dépendances
- Flexibilité et découplage

### 3.2 Packages Principaux
- `dio`: Gestion avancée des requêtes HTTP
- `provider`: Gestion de l'état
- `equatable`: Comparaison d'objets

## 4. Flux de Données

```
[ UI ] → [ Provider ] → [ API Service ] → [ Repository ] → [ API ]
   ↑         ↓             ↓                  ↓
   └─────────┴──────────────┴──────────────────┘
```

## 5. Gestion des Erreurs

### Principes
- Capture des exceptions `DioException`
- États de chargement explicites
- Remontée des erreurs via le provider

## 6. Configuration Recommandée

### Dio Configuration
```dart
final dio = Dio(BaseOptions(
  baseUrl: 'https://jsonplaceholder.typicode.com',
  connectTimeout: Duration(seconds: 5),
  receiveTimeout: Duration(seconds: 3),
));

// Ajout d'intercepteurs
dio.interceptors.add(LogInterceptor(
  request: true,
  responseBody: true,
  errorBody: true,
));
```

## 7. Bonnes Pratiques

### Séparation des Responsabilités
- Chaque classe a une responsabilité unique
- Découplage fort entre les couches
- Facilité de maintenance et de test

### Tests
- Possibilité de mocker facilement les dépendances
- Testabilité accrue grâce à l'architecture

## 8. Évolutions Possibles

### Axes d'amélioration
- Ajout de la persistance locale (SQLite, Hive)
- Implémentation de l'authentification
- Gestion plus fine des états de l'application
- Ajout de tests unitaires et d'intégration

## 9. Dépendances à Ajouter

### pubspec.yaml
```yaml
dependencies:
  flutter:
    sdk: flutter
  dio: ^5.4.1
  provider: ^6.1.1
  equatable: ^2.0.5

dev_dependencies:
  flutter_test:
    sdk: flutter
  mockito: ^5.4.2
```

## 10. Démarrage Rapide

1. Cloner le projet
2. Exécuter `flutter pub get`
3. Lancer l'application avec `flutter run`
