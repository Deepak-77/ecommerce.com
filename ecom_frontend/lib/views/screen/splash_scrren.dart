import 'package:ecom_frontend/common/theme.dart';
import 'package:ecom_frontend/sharepref.dart';
import 'package:ecom_frontend/views/screen/login_page.dart';
import 'package:ecom_frontend/views/screen/productscreen_page.dart';
import 'package:flutter/material.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5), () {
      storetoken();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: CircularProgressIndicator(
      color: Colors.red,
    )));
  }

  void storetoken() async {
    final data = await Pref().readData(key: 'saveToken');
    if (data == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Productscreen()),
      );
    }
  }
}
