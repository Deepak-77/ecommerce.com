import 'package:ecom_frontend/model/siginmodel.dart';

abstract class LoginState {}

class LogininitailState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginLodedState extends LoginState {
  final LoginResponsemodel response;

  LoginLodedState(this.response);
}

class LoginErrorState extends LoginState {
  final String? message;

  LoginErrorState(
    this.message,
  );
}
