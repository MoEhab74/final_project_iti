import 'package:dio/dio.dart';
import 'package:final_project/core/api/api_end_points.dart';
import 'package:final_project/core/api/api_interceptors.dart';
import 'package:final_project/core/api/app_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static const String baseUrl = ApiEndPoints.baseUrl;
  late Dio _dio;
  DioHelper() {
   _dio = Dio(BaseOptions(baseUrl: baseUrl));
   _dio.interceptors.add(ApiInterceptors(_dio));
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
    
  }


   Future<AppResponse> getRequest(String path) async {
    try {
      final response = await _dio.get(path);
      if (response.statusCode == 200) {
        return AppResponse(isSuccess: true, data: response.data, statusCode: response.statusCode);
      } else {
        return AppResponse(
          isSuccess: false,
          data: response.data,
          statusCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      return AppResponse(
        isSuccess: false,
        exception: e,
        statusCode: e.response?.statusCode,
      );
    }
  }
  
   Future<AppResponse> postRequest(
    String path, {
      // POST request data usually is Map<String, dynamic>
    Map<String, dynamic>? data,
  }) async {
    // Try-Catch for handling the request errors
    try {
      final response = await _dio.post(path, data: data);
      // status code for checking if the request is done successfully
      if (response.statusCode == 200 || response.statusCode == 201) {
        return AppResponse(isSuccess: true, data: response.data, statusCode: response.statusCode);
      } else {
        return AppResponse(
          isSuccess: false,
          data: response.data,
          statusCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      return AppResponse(
        isSuccess: false,
        exception: e,
        statusCode: e.response?.statusCode,
      );
    }
  }

  // Put Request
    Future<AppResponse> putRequest(
      String path, {
      Map<String, dynamic>? data,
    }) async {
      try {
        final response = await _dio.put(path, data: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          return AppResponse(isSuccess: true, data: response.data, statusCode: response.statusCode);
        } else {
          return AppResponse(
            isSuccess: false,
            data: response.data,
            statusCode: response.statusCode,
          );
        }
      } on DioException catch (e) {
        return AppResponse(
          isSuccess: false,
          exception: e,
          statusCode: e.response?.statusCode,
        );
      }
    }
}
