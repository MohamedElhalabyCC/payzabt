
enum Environment { dev, staging, prod }

class AppConfig {
  static AppConfig? _instance;

  final String appName;
  final Environment environment;

  AppConfig._internal({
    required this.appName,
    required this.environment,
  });

  static AppConfig get instance {
    if (_instance == null) {
      throw Exception('AppConfig not initialized. Call AppConfig.init() first.');
    }
    return _instance!;
  }

  static void init({required Environment environment}) {
    String appName;

    switch (environment) {
      case Environment.dev:
        appName = 'Payzabt Dev';
        break;
      case Environment.staging:
        appName = 'Payzabt Staging';
        break;
      case Environment.prod:
        appName = 'Payzabt';
        break;
    }

    _instance ??= AppConfig._internal(
      appName: appName,
      environment: environment,
    );
  }
  
  static Environment getEnvironmentFromArgs() {
    const defaultFlavor = 'dev'; // fallback
    const flavorStr = String.fromEnvironment('FLAVOR', defaultValue: defaultFlavor);

    switch (flavorStr) {
      case 'dev':
        return Environment.dev;
      case 'staging':
        return Environment.staging;
      case 'prod':
        return Environment.prod;
      default:
        return Environment.dev;
    }
  }
}
