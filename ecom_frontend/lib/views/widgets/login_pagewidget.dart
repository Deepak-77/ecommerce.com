import 'package:ecom_frontend/common/theme.dart';
import 'package:ecom_frontend/common/widgets/custom_button.dart';
import 'package:ecom_frontend/common/widgets/customtextform_filed.dart';
import 'package:ecom_frontend/cubit/login/loginCubit.dart';
import 'package:ecom_frontend/cubit/login/loginState.dart';
import 'package:ecom_frontend/views/screen/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPageWidget extends StatefulWidget {
  LoginPageWidget({super.key});

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

TextEditingController email = TextEditingController();
TextEditingController fullname = TextEditingController();
TextEditingController password = TextEditingController();

class _LoginPageWidgetState extends State<LoginPageWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginPage'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: BlocConsumer<LoginCubit, LoginState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'email',
                          style: CustomTheme.textStyle14,
                        ),
                      ),
                      CustomTextField(
                        controller: email,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'password',
                          style: CustomTheme.textStyle14,
                        ),
                      ),
                      CustomTextField(
                        controller: password,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomButton(
                            color: Colors.purpleAccent,
                            // color: CustomTheme.primaryColor,
                            text: 'login',
                            width: double.infinity,
                            navigation: () {
                              context.read<LoginCubit>().PostLogin(
                                  email: email.text, password: password.text);
                            }),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Center(
                          child: Text(
                            'if you haven' '+' '' 't sign up please sign up',
                            style: CustomTheme.textStyle14,
                          ),
                        ),
                      ),
                      InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage())),
                          child: Center(
                            child: Text(
                              'SignUp',
                              style: CustomTheme.textStyle18
                                  .copyWith(color: Colors.red),
                            ),
                          ))
                    ],
                  );
                },
                listener: (context, state) {
                  if (state is LoginLodedState) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: AlertDialog(
                              title: Text(state.response.status),
                            ),
                          );
                        });
                  }
                  if (state is LoginErrorState) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: AlertDialog(
                              title: Text(state.message.toString()),
                            ),
                          );
                        });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
