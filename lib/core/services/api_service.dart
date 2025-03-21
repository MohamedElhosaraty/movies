import 'dart:developer';
import 'package:dio/dio.dart';
import '../errors/server_failure.dart';
import '../utils/end_point.dart';

class ApiService {
  final Dio dio;

  ApiService({Dio? dioInstance}) : dio = dioInstance ?? Dio() {
    dio.options = BaseOptions(
      baseUrl: EndPoint.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {"Content-Type": "application/json"},
    );
    dio.interceptors.add(LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
  }

  Future<Response> getRequest(String endpoint,
      {Map<String, dynamic>? params}) async {
    try {
      final response = await dio.get(endpoint, queryParameters: params);
      return response;
    } on DioException catch (e) {
      log("DioException in GET: ${e.response?.statusCode} - ${e.message}");
      throw ServerFailure.fromDioError(e);
    }
  }

  Future<Response> postRequest(String endpoint,
      {bool isFormData = false, Map<String, dynamic>? data}) async {
    try {
      final response = await dio.post(endpoint,
          data: isFormData ? FormData.fromMap(data!) : data);
      return response;
    } on DioException catch (e) {
      log("DioException in POST: ${e.response?.statusCode} - ${e.message}");
      throw ServerFailure.fromDioError(e);
    }
  }

  Future<Response> putRequest(String endpoint,
      {Map<String, dynamic>? data}) async {
    try {
      final response = await dio.put(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      log("DioException in PUT: ${e.response?.statusCode} - ${e.message}");
      throw ServerFailure.fromDioError(e);
    }
  }

  Future<Response> deleteRequest(String endpoint,
      {Map<String, dynamic>? params}) async {
    try {
      final response = await dio.delete(endpoint, queryParameters: params);
      return response;
    } on DioException catch (e) {
      log("DioException in DELETE: ${e.response?.statusCode} - ${e.message}");
      throw ServerFailure.fromDioError(e);
    }
  }
}
