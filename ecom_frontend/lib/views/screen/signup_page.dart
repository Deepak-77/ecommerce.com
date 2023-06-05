import 'package:ecom_frontend/cubit/signup/signupCubit.dart';
import 'package:ecom_frontend/services/repository/signup_repo.dart';
import 'package:ecom_frontend/views/widgets/signupwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
      create: (_) => SignupCubit(SignUpRepository()),
      child: const SignUpPageWidget());
}
