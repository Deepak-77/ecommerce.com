import 'package:ecom_frontend/common/theme.dart';
import 'package:ecom_frontend/common/widgets/custom_button.dart';
import 'package:ecom_frontend/common/widgets/customtextform_filed.dart';
import 'package:ecom_frontend/views/screen/signup_page.dart';
import 'package:flutter/material.dart';

class LoginPageWidget extends StatelessWidget {
  const LoginPageWidget({super.key});

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
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'mobilenumber',
                    style: CustomTheme.textStyle14,
                  ),
                ),
                CustomTextField(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'password',
                    style: CustomTheme.textStyle14,
                  ),
                ),
                CustomTextField(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomButton(
                      // color: CustomTheme.primaryColor,
                      text: 'login',
                      width: double.infinity,
                      navigation: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => OtpVerification()));
                      }),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'if you haven' + 't sign up please sign up',
                    style: CustomTheme.textStyle14,
                  ),
                ),
                InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage())),
                    child: Text(
                      'SignUp',
                      style:
                          CustomTheme.textStyle18.copyWith(color: Colors.red),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
