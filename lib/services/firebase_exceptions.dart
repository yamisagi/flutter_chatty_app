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
class NoInternetConnection implements Exception{}
class UserNotLoggedInAuthException implements Exception {}
class NoInitializationException implements Exception {}

// Database exceptions.
class DatabaseAlreadyInitializedException implements Exception {}
class UnableToGetDatabaseException implements Exception {}
class DatabaseNotOpenException implements Exception {}
class UserAlreadyExist implements Exception{}
class UserNotFoundException implements Exception{}
class CouldNotDeleteNoteException implements Exception{}
class NotesNotFoundException implements Exception{}
class CouldNotUpdateNoteException implements Exception{}