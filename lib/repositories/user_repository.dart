import 'package:dio/dio.dart';
import 'package:myFlutterApp/network/response/api_response.dart';
import 'package:myFlutterApp/network/retrofit/apis.dart';
import '../interface/iuser_repository.dart';
import '../network/retrofit/api_client.dart';

class UserRepository implements IUserRepository {
  ApiClient? _apiRequest;
  Dio? dio;

  UserRepository() {
    dio = Dio(
      BaseOptions(
        contentType: "application/json",
        baseUrl: Apis.baseUrl,
      ),
    );
    _apiRequest = ApiClient(dio: dio!);
  }

  @override
  Future<APIResponse> getAllUsers() async {
    var res = await _apiRequest?.getAllUsers();
    return APIResponse(true, data: res);
  }
}
