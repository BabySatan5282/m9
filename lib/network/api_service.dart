import 'dart:developer';
import 'package:get/get.dart';
import 'api_exception.dart';

enum Method {
  get,
  post,
}

class ApiService {
  final GetConnect _connect = GetConnect();
  static const String _baseUrl = "https://m9-shankoemee.blogspot.com";

  dynamic get(String endPoind, [String? baseUrl]) async {
    return await _request(endPoind, Method.get, null, baseUrl);
  }

  dynamic post(String endPoind, [Map<String, dynamic>? formData]) async {
    return await _request(endPoind, Method.post, formData);
  }

  dynamic _request(String endPoint, Method method,
      [Map<String, dynamic>? formData, String? baseUrl]) async {
    Response response;
    try {
      if (method == Method.get) {
        log("GET : ${(baseUrl ?? _baseUrl) + endPoint}");
        response = await _connect.get((baseUrl ?? _baseUrl) + endPoint);
      } else {
        response = await _connect.post(
          _baseUrl + endPoint,
          formData,
        );
      }
      log(response.statusCode.toString());

      // log(response.body.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else if (response.status.connectionError) {
        throwException(503);
      } else if (response.statusCode == 422) {
        throw ApiException(response.body['message']);
      } else {
        throwException(response.statusCode ?? 0);
      }
    } catch (e) {
      rethrow;
    }
  }

  void throwException(int statusCode) {
    throw ApiException.statusCode(statusCode);
  }
}
