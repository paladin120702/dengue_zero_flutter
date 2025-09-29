class AuthException implements Exception {
  @override
  String toString() {
    return 'Ocorreu um erro no processo de autenticação.';
  }
}
