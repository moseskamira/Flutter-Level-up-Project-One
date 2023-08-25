class APIResponse<T> {
  bool success;
  T? data;
  String? error;
  dynamic extras;

  APIResponse(this.success, {this.data, this.error, this.extras});
}
