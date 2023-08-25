import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'apis.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient({required Dio dio}) => _ApiClient(dio);

  @GET(Apis.users)
  Future<dynamic> getAllUsers();
}
