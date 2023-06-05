import 'package:ecom_frontend/cubit/login/loginCubit.dart';
import 'package:ecom_frontend/services/repository/login_repo.dart';
import 'package:ecom_frontend/views/widgets/login_pagewidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (contex) => LoginCubit(LoginRepo()), child: LoginPageWidget());
  }
}
