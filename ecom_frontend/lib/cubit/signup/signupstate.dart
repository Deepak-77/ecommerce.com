import 'package:ecom_frontend/model/sign_up_model.dart';

abstract class SignUpState {}

class SignUpinitailState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpLodedState extends SignUpState {
  final SignUpResModel response;

  SignUpLodedState(this.response);
}

class SignUpErrorState extends SignUpState {
  final String? message;

  SignUpErrorState(
    this.message,
  );
}
