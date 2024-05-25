class ApiException implements Exception {
  final String message;
  const ApiException([this.message = "Something Went Wrong!"]);

  factory ApiException.statusCode(int statusCode) {
    switch (statusCode) {
      case 404:
        return const ApiException("Service Not Found!");
      case 503:
        return const ApiException("No Internet Connection!");
      case 500:
        return const ApiException("Internal Server Error");
      default:
        return const ApiException();
    }
  }
}
