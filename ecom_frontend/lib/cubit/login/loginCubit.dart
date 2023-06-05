import 'package:ecom_frontend/cubit/login/loginState.dart';
import 'package:ecom_frontend/services/repository/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo repo;

  LoginCubit(this.repo) : super(LogininitailState());

  Future<void> PostLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());

    try {
      final response = await repo.postLogin(email: email, password: password);

      emit(LoginLodedState(response));
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }
}
