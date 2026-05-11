

abstract class Error{
  final String message;
  Error(this.message);
}

class ValidationError extends Error{
  ValidationError(super.message);
}

class ProcessError extends Error{
  ProcessError(super.message);
}


class DatabaseError extends Error{
  DatabaseError(super.message);
}