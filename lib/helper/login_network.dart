import 'package:dio/dio.dart';
import 'package:home_yogi_flutter/models/response/common_response.dart';

loginServices(String email) async {
  CommonResponse commonResponse = CommonResponse();
  try {
    var response = await Dio().post(
      'http://134.209.145.75:3008/api/v1/auth/login',
      data: {"email": email},
      options: Options(
        // contentType: Headers.contentTypeHeader,
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );
    print(response);
    if (response.statusCode == 200) {
      commonResponse = CommonResponse.fromJson(response.data);
    }
    return commonResponse;
  } catch (e) {
    print(e);
    return commonResponse;
  }
}