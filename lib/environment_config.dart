// Global accessable provider that return the value of APIKey
// Since the Api is never change during runtime so we simply use provier
// final environmentConfigProvider = Provider<EnvironmentConfig>((ref) {
//   return EnvironmentConfig();
// });

class EnvironmentConfig {
  // We add the api key by running 'flutter run --dart-define=movieApiKey=MYKEY
  final movieApiKey = const String.fromEnvironment("movieApiKey");
}
