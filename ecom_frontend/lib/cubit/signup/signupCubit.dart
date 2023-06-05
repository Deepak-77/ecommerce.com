import 'package:ecom_frontend/cubit/signup/signupstate.dart';
import 'package:ecom_frontend/services/repository/signup_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignUpState> {
  final SignUpRepository repo;

  SignupCubit(this.repo) : super(SignUpinitailState());

  Future<void> postsignUp({
    required String email,
    required String fullname,
    required String password,
  }) async {
    emit(SignUpLoadingState());

    try {
      final response = await repo.userSignUp(
          email: email, fullname: fullname, password: password);

      emit(SignUpLodedState(response));
    } catch (e) {
      emit(SignUpErrorState(e.toString()));
    }
  }
}
