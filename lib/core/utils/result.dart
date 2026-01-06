enum Status { success, error, loading }

class Result<T> {
  const Result._({required this.status, this.data, this.message});

  final Status status;
  final T? data;
  final String? message;

  factory Result.success(T data) =>
      Result._(status: Status.success, data: data);

  factory Result.error(String message) =>
      Result._(status: Status.error, message: message);
}
