import 'package:ecom_frontend/common/theme.dart';
import 'package:ecom_frontend/common/widgets/custom_button.dart';
import 'package:ecom_frontend/common/widgets/customtextform_filed.dart';
//import 'package:ecom_frontend/common/widgets/custom_button.dart';
import 'package:ecom_frontend/cubit/signup/signupCubit.dart';
import 'package:ecom_frontend/cubit/signup/signupstate.dart';
import 'package:ecom_frontend/views/widgets/login_pagewidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPageWidget extends StatefulWidget {
  const SignUpPageWidget({super.key});

  @override
  State<SignUpPageWidget> createState() => _SignUpPageWidgetState();
}

TextEditingController email = TextEditingController();
TextEditingController fullname = TextEditingController();
TextEditingController password = TextEditingController();

class _SignUpPageWidgetState extends State<SignUpPageWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocConsumer<SignupCubit, SignUpState>(
            builder: (context, state) {
              {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Signup ',
                        style: CustomTheme.textStyle18,
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text('Enter Your Email',
                          style: CustomTheme.textStyle14),
                    ),
                    CustomTextField(
                      controller: email,
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text('Enter Your fullname',
                          style: CustomTheme.textStyle14),
                    ),
                    CustomTextField(
                      controller: fullname,
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text('Enter Your password',
                          style: CustomTheme.textStyle14),
                    ),
                    CustomTextField(
                      controller: password,
                    ),

                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Stack(
                          children: [
                            CustomButton(
                              text: 'Signup',
                              width: double.infinity,
                              color: Colors.purpleAccent,
                              height: 56,
                              navigation: () {
                                context.read<SignupCubit>().postsignUp(
                                    email: email.text,
                                    fullname: fullname.text,
                                    password: password.text);

                                // print(cubit);
                                print('hello');

                                // print(cubit);
                              },
                            ),
                            if (state is SignUpLoadingState)
                              Positioned(
                                  top: 10,
                                  bottom: 10,
                                  left: 25,
                                  child: CircularProgressIndicator(
                                    color: Colors.green,
                                  )),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }
              //return SizedBox();
            },
            listener: (context, state) {
              if (state is SignUpLodedState) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: AlertDialog(
                          title: Text(state.response.message.toString()),
                          actions: [
                            CustomButton(
                                height: 40,
                                color: Color(0xff2FC4B2),
                                text: 'ok',
                                width: 120,
                                navigation: () {
                                  if (state.response.status == 'success') {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (BuildContext context) {
                                      return LoginPageWidget();
                                    }));
                                  }
                                })
                          ],
                        ),
                      );
                    });
              }
            },
          ),
        ),
      ),
    );
  }
}
