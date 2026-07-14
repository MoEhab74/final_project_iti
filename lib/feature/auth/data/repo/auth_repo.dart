import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:final_project/core/api/api_end_points.dart';
import 'package:final_project/core/api/dio_helper.dart';
import 'package:final_project/core/utils/secure_local_storage.dart';
import 'package:final_project/core/utils/service_locator.dart';
import 'package:final_project/feature/auth/data/models/login_response_model.dart';

class AuthRepo {
  final DioHelper _dioHelper;
  AuthRepo(this._dioHelper);
  // login method
  Future<Either<String, LoginResponseModel>> login(
    String email,
    String password,
  ) async {
    final response = await _dioHelper.postRequest(
      ApiEndPoints.login,
      // Instead of passing data like this, we can have a user model and pass its toJson() method
      data: {'email': email, 'password': password},
    );
    if (response.isSuccess) {
      var loginResponse = LoginResponseModel.fromJson(response.data);
      // Get the token
      String token = loginResponse.accessToken;
      // Save the token
      await locator<SecureLocalStorageHelper>().writeData('token', token);
      log('Token saved successfully');
      // Login successful ===> Take the Token which is inside the response data and return it
      log('Login successful: ${response.data}');
      return Right(loginResponse);
    } else {
      final String msg =
          response.errorMessage ??
          'Request failed (status: ${response.statusCode ?? 'unknown'})';
      log(
        'Login failed. statusCode=${response.statusCode}, data=${response.data},\nmessage=${response.errorMessage}',
      );
      return Left(msg);
    }
  }

  // Logout method
  Future<Either<String, void>> logOut() async {
    try {
      // Delete the token from secure storage
      await locator<SecureLocalStorageHelper>().deleteData('token');
      log('Token deleted successfully');
      return const Right(null);
    } catch (e) {
      log('Logout failed: $e');
      return Left('Logout failed: $e');
    }
  }
}
