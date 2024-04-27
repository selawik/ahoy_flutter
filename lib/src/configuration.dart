import 'package:http/http.dart';

class Configuration {
  final ApplicationEnvironment environment;
  final String baseUrl;
  final int port;
  final String scheme;
  final String ahoyPath;
  final String eventsPath;
  final String visitsPath;
  final String userAgent;
  final Duration? visitDuration;

  Configuration({
    required this.environment,
    required this.baseUrl,
    this.port = 443,
    this.scheme = 'https',
    this.ahoyPath = 'ahoy',
    this.eventsPath = 'events',
    this.visitsPath = 'visits',
    this.userAgent = 'Ahoy Flutter',
    this.visitDuration,
  });

  Future<StreamedResponse> urlRequestHandler(Request request) async {
    return await Client().send(request);
  }

  dynamic operator [](String key) {
    switch (key) {
      case 'platform':
        return environment.platform;
      case 'appVersion':
        return environment.appVersion;
      case 'osVersion':
        return environment.osVersion;
      case 'userAgent':
        return userAgent;
      default:
        throw Exception('Invalid key: $key');
    }
  }
}

class ApplicationEnvironment {
  final String platform;
  final String appVersion;
  final String osVersion;

  ApplicationEnvironment({
    required this.platform,
    required this.appVersion,
    required this.osVersion,
  });
}
