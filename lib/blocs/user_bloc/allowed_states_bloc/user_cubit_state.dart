import 'package:equatable/equatable.dart';
import '../../../network/response/users_response.dart';

abstract class UserCubitState extends Equatable {
  const UserCubitState();
}

class InitialState extends UserCubitState {
  @override
  List<Object> get props => [];
}

class LoadingState extends UserCubitState {
  @override
  List<Object> get props => [];
}

class ErrorState extends UserCubitState {
  final String? message;

  const ErrorState({this.message});

  @override
  List<Object> get props => [];
}

class SuccessState extends UserCubitState {
  final UsersResponse? response;

  const SuccessState({this.response});

  @override
  List<Object> get props => [];
}
