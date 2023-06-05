import 'package:dio/dio.dart';
import 'package:ecom_frontend/model/sign_up_model.dart';
import 'package:ecom_frontend/model/sign_up_req_model.dart';
import 'package:ecom_frontend/api.dart';

class AuthServices {
  Future<SignUpResModel> login({required SignUpReqModel signUpReqModel}) async {
    try {
      Dio dio = Dio();
      Response<String> response = await dio.post(
        signUpURL,
        data: signUpReqModel.toJson(),
      );
      return signUpResModelFromJson(response.data!);
    } on DioError catch (e) {
      throw 'e';
    }
  }
}
