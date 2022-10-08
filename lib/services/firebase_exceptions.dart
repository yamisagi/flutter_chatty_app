// For login.dart
class UserNotFoundAuthException implements Exception {}

class WrongPasswordAuthException implements Exception {}

class EmailAlreadyExistsAuthException implements Exception {}

// For registering user.
class UserAlreadyExistsAuthException implements Exception {}

class WeakPasswordAuthException implements Exception {}

class InvalidEmailAuthException implements Exception {}

// Generic exceptions.
class GenericAuthException implements Exception {}

class NoInternetConnection implements Exception {}

class UserNotLoggedInAuthException implements Exception {}

class NoInitializationException implements Exception {}
