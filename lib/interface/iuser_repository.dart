import '../network/response/api_response.dart';

abstract class IUserRepository {
  Future<APIResponse> getAllUsers();
}
