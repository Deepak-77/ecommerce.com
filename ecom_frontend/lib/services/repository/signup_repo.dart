import 'package:dio/dio.dart';
import 'package:ecom_frontend/api.dart';
import 'package:ecom_frontend/model/sign_up_model.dart';

class SignUpRepository {
  final Dio _dio = Dio();

  Future<SignUpResModel> userSignUp(
      {required String email,
      required String fullname,
      required String password}) async {
    try {
      final Response response = await _dio.post(
          'http://192.168.1.67:5000/api/userSignup',
          data: {'email': email, 'fullname': fullname, 'password': password});

      print(response.data);

      return SignUpResModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
    }
    throw 'error';
  }
}
