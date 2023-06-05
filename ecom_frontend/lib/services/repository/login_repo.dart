import 'package:dio/dio.dart';
import 'package:ecom_frontend/api.dart';
import 'package:ecom_frontend/model/siginmodel.dart';
import 'package:ecom_frontend/sharepref.dart';

final Pref sharepref = Pref();

class LoginRepo {
  final Dio _dio = Dio();

  Future<LoginResponsemodel> postLogin(
      {required String email, required String password}) async {
    try {
      final response =
          await _dio.post(login, data: {'email': email, 'password': password});
      // print(response.data);

      final responseData = LoginResponsemodel.fromJson(response.data);
      const String keyToken = 'AcessToken';

      if (responseData.status == "success") {
        final token = responseData.data.token;

        Pref().writeData(key: 'saveToken', value: token).then((_) async {
          final userToken = await Pref().readData(key: 'saveToken');

          // print(userToken);
        });

        // return sharepref.
      }

      return responseData;
    } on DioError catch (e) {
      print(e.message);
      print(e.error);
    }
    throw 'err';
  }
}
