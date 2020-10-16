

import 'package:dio/dio.dart';
import 'package:myFlutterApp/models/user_model.dart';
import 'package:retrofit/retrofit.dart';

@RestApi(baseUrl: "http://dummy.restapiexample.com/")
abstract class ApiClient {
  // factory ApiClient(Dio dio) = _ApiClient;

  @GET("api/v1/employees")
  Future<List<User>> getAllUsers();

}