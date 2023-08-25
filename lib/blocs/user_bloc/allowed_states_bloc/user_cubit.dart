import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../network/response/users_response.dart';
import '../../../repositories/user_repository.dart';
import 'user_cubit_state.dart';

class UserCubit extends Cubit<UserCubitState> {
  final UserRepository repository;

  UserCubit({required this.repository}) : super(InitialState());

  void getAllUsers() async {
    try {
      emit(LoadingState());
      final response = await repository.getAllUsers();
      if (response.success) {
        dynamic resp = response.data;
        UsersResponse usersResponse = UsersResponse.fromJson(resp);
        emit(SuccessState(response: usersResponse));
      } else {
        emit(ErrorState(message: response.data.message));
      }
    } on DioError catch (res, _) {
      emit(
        ErrorState(
          message: res.response?.data['error'] ??
              res.response?.data['message'] ??
              res.response?.data['errorMessage'] ??
              res.response?.statusMessage ??
              'Something went wrong',
        ),
      );
    }
  }
}
