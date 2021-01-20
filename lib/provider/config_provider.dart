import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../environment_config.dart';

// Global accessable provider that return the value of APIKey
// Since the Api is never change during runtime so we simply use provier

// This is the root of Riverpod Provider
final environmentConfigProvider = Provider<EnvironmentConfig>((ref) {
  return EnvironmentConfig();
});
