class ApiConfig {
  ApiConfig({required this.baseUrl});

  final String baseUrl;

  bool get isValid => baseUrl.isNotEmpty;
}
