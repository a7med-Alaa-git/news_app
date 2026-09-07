class UnexpectedException implements Exception {
  final String message;

  UnexpectedException({required this.message});
}

void handleUnexpectedException(dynamic error) {
  throw UnexpectedException(message: error.toString());
}
