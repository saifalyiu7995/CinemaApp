import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../utils/app_constant.dart';
import 'app_exceptions.dart';

class ApiBaseHelper {
  static Future<dynamic> httpGetRequest(String endPoint,
      {String base = AppConstant.apiBaseURL,
      bool returnByteData = false}) async {
    http.Response response;
    try {
      response = await http.get(
        Uri.parse('$base$endPoint'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': token!
        },
      );
    } on SocketException {
      throw FetchDataException(AppConstant.noInternetMsg);
    } on FormatException {
      throw FetchDataException(AppConstant.badResponseFormat);
    } on TimeoutException {
      throw FetchDataException(AppConstant.slowInternetMsg);
    } catch (_) {
      throw FetchDataException(AppConstant.exceptionMessage);
    }
    return await _returnResponse(response,
        returnBytes: returnByteData, endPoint: endPoint, requestType: "GET");
  }

  static Future<dynamic> httpPostRequest(
    String endPoint, {
    Object? body,
    String? base,
    bool isLogin = false,
  }) async {
    http.Response response;

    try {
      response = await http
          .post(Uri.parse('$base$endPoint'), body: jsonEncode(body), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': '$token'
      });
    } on SocketException {
      throw FetchDataException(AppConstant.noInternetMsg);
    } on FormatException {
      throw FetchDataException(AppConstant.badResponseFormat);
    } on TimeoutException {
      throw FetchDataException(AppConstant.slowInternetMsg);
    } catch (_) {
      throw FetchDataException(AppConstant.exceptionMessage);
    }
    return await _returnResponse(response,
        endPoint: endPoint, requestType: "POST", body: body);
  }

  static Future<dynamic> httpPutRequest(String endPoint,
      {Object? body, String base = AppConstant.apiBaseURL}) async {
    http.Response response;
    try {
      response = await http
          .put(Uri.parse('$base$endPoint'), body: jsonEncode(body), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      });
    } on SocketException {
      throw FetchDataException(AppConstant.noInternetMsg);
    } on FormatException {
      throw FetchDataException(AppConstant.badResponseFormat);
    } on TimeoutException {
      throw FetchDataException(AppConstant.slowInternetMsg);
    } catch (_) {
      throw FetchDataException(AppConstant.exceptionMessage);
    }
    return await _returnResponse(response);
  }

  static Future<dynamic> httpPatchRequest(String endPoint, Object body) async {
    http.Response response;
    try {
      response = await http.patch(
          Uri.parse('${AppConstant.apiBaseURL}$endPoint'),
          body: jsonEncode(body),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json'
          });
    } on SocketException {
      throw FetchDataException(AppConstant.noInternetMsg);
    } on FormatException {
      throw FetchDataException(AppConstant.badResponseFormat);
    } on TimeoutException {
      throw FetchDataException(AppConstant.slowInternetMsg);
    } catch (_) {
      throw FetchDataException(AppConstant.exceptionMessage);
    }
    return await _returnResponse(response);
  }

  static Future<dynamic> httpDeleteRequest(String endPoint,
      {Object? body}) async {
    http.Response response;
    try {
      response = await http.delete(
          Uri.parse('${AppConstant.apiBaseURL}$endPoint'),
          body: jsonEncode(body),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          });
    } on SocketException {
      throw FetchDataException(AppConstant.noInternetMsg);
    } on FormatException {
      throw FetchDataException(AppConstant.badResponseFormat);
    } on TimeoutException {
      throw FetchDataException(AppConstant.slowInternetMsg);
    } catch (_) {
      throw FetchDataException(AppConstant.exceptionMessage);
    }
    return await _returnResponse(response);
  }

  static Future<dynamic> httpMultiPartRequest(String endPoint,
      {required Map<String, String> fields,
      http.MultipartFile? file,
      String base = AppConstant.apiBaseURL}) async {
    http.Response response;
    try {
      var request = http.MultipartRequest('POST', Uri.parse('$base$endPoint'));
      request.headers.addAll({
        'Content-type': 'multipart/form-data',
        'Accept': 'application/json',
      });
      request.files.add(file!);
      request.fields.addAll(fields);
      response = await http.Response.fromStream(await request.send());
    } on SocketException {
      throw FetchDataException(AppConstant.noInternetMsg);
    } on FormatException {
      throw FetchDataException(AppConstant.badResponseFormat);
    } on TimeoutException {
      throw FetchDataException(AppConstant.slowInternetMsg);
    } catch (ex) {
      throw FetchDataException(AppConstant.exceptionMessage);
    }

    return await _returnResponse(response);
  }
}

bool firstTime = true;
dynamic _returnResponse(http.Response response,
    {String? endPoint,
    Object? body,
    String? requestType,
    bool returnBytes = false}) async {
  final jsonResponse = returnBytes && response.statusCode == 200
      ? response.bodyBytes
      : jsonDecode(response.body);
  switch (response.statusCode) {
    case 200:
      return response;
    case 400:
      throw BadRequestException(
          jsonResponse['message'] ?? AppConstant.exceptionMessage);
    case 401:
      throw InvalidInputException(
          jsonResponse['message'] ?? AppConstant.exceptionMessage);
    case 403:
      throw UnauthorizedException(
          jsonResponse['message'] ?? AppConstant.exceptionMessage);
    case 404:
      throw FetchDataException(
          jsonResponse['message'] ?? AppConstant.exceptionMessage);
    case 500:
    default:
      throw FetchDataException(
          jsonResponse['message'] ?? AppConstant.exceptionMessage);
  }
}
