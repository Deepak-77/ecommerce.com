import 'package:ecom_frontend/common/widgets/custom_button.dart';
import 'package:ecom_frontend/common/widgets/customtextform_filed.dart';
import 'package:ecom_frontend/cubit/signup/signupCubit.dart';
import 'package:ecom_frontend/services/repository/signup_repo.dart';
import 'package:ecom_frontend/views/screen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => SignUpRepository()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
