// import 'dart:html';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
//
// import '../helper/injector.dart';
// import '../models/response/common_response.dart';
// import 'package:dio/dio.dart' as dio_reference;
//
// import '../shared/constants/pref_keys.dart';
// import '../shared/utils/math_utils.dart';
//
// class BaseNetworkHelper {
//   static const String baseUrl = "http://demo.iroidsolutions.com:7000/api/v1";
//   static const String socketUrl = "";
//
//   static Future<CommonResponse> get(String partUrl, {Map<String, dynamic>? queryParameters, bool isShowToast = true}) async {
//     final fullUrl = baseUrl + "/" + partUrl;
//     CommonResponse commonResponse = CommonResponse();
//     dio_reference.Dio dio = initDio(partUrl, false);
//     await dio.get(fullUrl, queryParameters: queryParameters).then((response) async {
//       if (response.statusCode == 401) {
//         await MathUtils.performLogout();
//         return null;
//       } else {
//         if (response.data != null) {
//           commonResponse = CommonResponse.fromJson(response.data);
//           if (isShowToast) {
//             if (commonResponse.dioMessage != null && commonResponse.dioMessage != "") {
//               MathUtils.showSuccessToast(commonResponse.dioMessage);
//             }
//           }
//         }
//       }
//     }).catchError((e) async {
//       if (kDebugMode) {
//         print(e);
//       }
//       if (e.dioMessage.toString().contains("401")) {
//         await MathUtils.performLogout();
//         return null;
//       }
//       try {
//         debugPrint("err ==== ");
//         if (kDebugMode) {
//           print(e);
//
//           print(e.response.data);
//         }
//         // Utils.showErrToast(e.response.data["message"]);
//         if (e.toString().contains("422")) {
//           ErrorResponse response = ErrorResponse.fromJson(e.response.data);
//           if (response.message != null) {
//             MathUtils.showErrToast(response.message!.details!.first.message);
//           }
//         } else {
//           ErrorSimpleResponse response = ErrorSimpleResponse.fromJson(e.response.data);
//           if (response.message != null) MathUtils.showErrToast(response.message);
//         }
//       } catch (e) {
//         if (kDebugMode) {
//           print(e);
//         }
//       }
//     });
//     return commonResponse;
//   }
//
//   static Future<CommonResponse> post(String partUrl, Map<String, dynamic> queryParameters,
//       {Map<String, dynamic>? reqBody, bool isShowToast = true, bool isMultipart = false, FormData? formData}) async {
//     final fullUrl = baseUrl + "/" + partUrl;
//     CommonResponse commonResponse = CommonResponse();
//     dio_reference.Dio dio = initDio(partUrl, isMultipart);
//     await dio.post(fullUrl, queryParameters: queryParameters, data: isMultipart ? formData : reqBody).then((response) async {
//       // print(response.data);
//       if (response.statusCode == 401) {
//         await MathUtils.performLogout();
//         return null;
//       } else {
//         if (response.data != null) {
//           // debugPrint(fullUrl);
//           // debugPrint("res ==== " + response.data.toString());
//           if (isShowToast) {
//             if (commonResponse.dioMessage != null && commonResponse.dioMessage != "") {
//               MathUtils.showSuccessToast(commonResponse.dioMessage);
//             }
//           }
//           commonResponse = CommonResponse.fromJson(response.data);
//         }
//       }
//     }).catchError((e) async {
//       if (kDebugMode) {
//         print(e);
//       }
//       if (e.dioMessage.toString().contains("401")) {
//         await MathUtils.performLogout();
//         return null;
//       }
//       try {
//         debugPrint("err ==== ");
//         if (kDebugMode) {
//           print(e);
//           print(e.response.data);
//         }
//         // Utils.showErrToast(e.response.data["message"]);
//         if (e.toString().contains("422")) {
//           ErrorResponse response = ErrorResponse.fromJson(e.response.data);
//           if (response.message != null) {
//             MathUtils.showErrToast(response.message!.details!.first.message);
//           }
//         } else {
//           debugPrint(fullUrl.toString() + "res ==== " + e.response.data.toString());
//           ErrorSimpleResponse response = ErrorSimpleResponse.fromJson(e.response.data);
//           if (response.message != null) MathUtils.showErrToast(response.message);
//         }
//       } catch (e) {
//         if (kDebugMode) {
//           print(e);
//         }
//       }
//     });
//     return commonResponse;
//   }
//
//   static Future<CommonResponse> put(String partUrl, Map<String, dynamic> reqBody,
//       {bool isShowToast = true, bool isMultipart = false, FormData? formData}) async {
//     final fullUrl = baseUrl + "/" + partUrl;
//     CommonResponse commonResponse = CommonResponse();
//     dio_reference.Dio dio = initDio(partUrl, isMultipart);
//     await dio.put(fullUrl, data: isMultipart ? formData : reqBody).then((response) async {
//       if (response.statusCode == 401) {
//         await MathUtils.performLogout();
//         return null;
//       } else {
//         if (response.data != null) {
//           // debugPrint("res ==== " + response.data.toString());
//           commonResponse = CommonResponse.fromJson(response.data);
//           if (isShowToast) {
//             if (commonResponse.dioMessage != null && commonResponse.dioMessage != "") {
//               MathUtils.showSuccessToast(commonResponse.dioMessage);
//             }
//           }
//         }
//       }
//     }).catchError((e) async {
//       if (kDebugMode) {
//         print(e);
//       }
//       if (e.dioMessage.toString().contains("401")) {
//         await MathUtils.performLogout();
//         return null;
//       }
//       try {
//         debugPrint("err ==== ");
//         if (kDebugMode) {
//           print(e);
//           print(e.response.data);
//         }
//         // Utils.showErrToast(e.response.data["message"]);
//         if (e.toString().contains("422")) {
//           ErrorResponse response = ErrorResponse.fromJson(e.response.data);
//           if (response.message != null) {
//             MathUtils.showErrToast(response.message!.details!.first.message);
//           }
//         } else {
//           // debugPrint("res ==== " + e.response.data.toString());
//           ErrorSimpleResponse response = ErrorSimpleResponse.fromJson(e.response.data);
//           if (response.message != null) MathUtils.showErrToast(response.message);
//         }
//       } catch (e) {
//         if (kDebugMode) {
//           print(e);
//         }
//       }
//     });
//
//     return commonResponse;
//   }
//
//   static Future<CommonResponse> delete(String partUrl,
//       {Map<String, dynamic>? reqBody, bool isShowToast = true, bool isMultipart = false, FormData? formData}) async {
//     final fullUrl = baseUrl + "/" + partUrl;
//     CommonResponse commonResponse = CommonResponse();
//     dio_reference.Dio dio = initDio(partUrl, isMultipart);
//     await dio.delete(fullUrl, data: isMultipart ? formData : reqBody).then((response) async {
//       if (response.statusCode == 401) {
//         await MathUtils.performLogout();
//         return null;
//       } else {
//         if (response.data != null) {
//           // debugPrint("res ==== " + response.data.toString());
//           commonResponse = CommonResponse.fromJson(response.data);
//           if (isShowToast) {
//             if (commonResponse.dioMessage != null && commonResponse.dioMessage != "") {
//               MathUtils.showSuccessToast(commonResponse.dioMessage);
//             }
//           }
//         }
//       }
//     }).catchError((e) async {
//       if (kDebugMode) {
//         print(e);
//       }
//       if (e.dioMessage.toString().contains("401")) {
//         await MathUtils.performLogout();
//         return null;
//       }
//       try {
//         debugPrint("err ==== ");
//         if (kDebugMode) {
//           print(e);
//           print(e.response.data);
//         }
//         // Utils.showErrToast(e.response.data["message"]);
//         if (e.toString().contains("422")) {
//           ErrorResponse response = ErrorResponse.fromJson(e.response.data);
//           if (response.message != null) {
//             MathUtils.showErrToast(response.message!.details!.first.message);
//           }
//         } else {
//           // debugPrint("res ==== " + e.response.data.toString());
//           ErrorSimpleResponse response = ErrorSimpleResponse.fromJson(e.response.data);
//           if (response.message != null) MathUtils.showErrToast(response.message);
//         }
//       } catch (e) {
//         if (kDebugMode) {
//           print(e);
//         }
//       }
//     });
//
//     return commonResponse;
//   }
//
//   static getMultipartFileFromPath(String? imagePath) async {
//     if (imagePath == null) {
//       return null;
//     }
//     return await dio_reference.MultipartFile.fromFile(imagePath, filename: imagePath.split("/").last);
//   }
//
//   static dio_reference.Dio initDio(String partUrl, bool isMultipart) {
//     var dio = dio_reference.Dio();
//     Map<String, String?> headers;
//     String acceptHeader;
//     String contentTypeHeader;
//
//     acceptHeader = 'application/json';
//     contentTypeHeader = isMultipart ? 'multipart/form-data' : 'application/json';
//
//     headers = {
//       HttpHeaders.acceptHeader: acceptHeader,
//       HttpHeaders.contentTypeHeader: contentTypeHeader,
//       HttpHeaders.authorizationHeader:
//       Injector.storage.read(PrefKeys.accessToken) != null ? 'Bearer ' + Injector.storage.read(PrefKeys.accessToken)! : null
//     };
//     final fullUrl = baseUrl + "/" + partUrl;
//     debugPrint(fullUrl);
//     // debugPrint(Injector.prefs.getString(PrefKeys.token));
//     dio_reference.BaseOptions options = dio_reference.BaseOptions(baseUrl: fullUrl, connectTimeout: 20000, receiveTimeout: 30000, headers: headers);
//     dio.options = options;
//     return dio;
//   }
// }
