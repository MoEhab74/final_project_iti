import 'package:final_project/core/utils/service_locator.dart';
import 'package:final_project/feature/auth/cubit/auth_states.dart';
import 'package:final_project/feature/auth/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';  


class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  // Login method

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoadingState());
    await locator<AuthRepo>().login(email, password).then((result) {
      result.fold(
        (failure) {
          // Handle failure
          debugPrint('Login failed: $failure');
          emit(AuthFailureState(errorMessage: failure));
        },
        (loginResponse) {
          // Handle success
          debugPrint('Login successful: ${loginResponse.accessToken}');
          emit(
            AuthSuccessState(
              'Login successful',
              token: loginResponse.accessToken,
            ),
          );
        },
      );
    });
  }

  Future<void> logOut() async {
    emit(AuthLoadingState());
    await locator<AuthRepo>().logOut().then((result) {
      result.fold(
        (failure) {
          debugPrint('Logout failed: $failure');
          emit(AuthFailureState(errorMessage: failure.toString()));
        },
        (_) {
          debugPrint('Logout successful');
          emit(AuthLoggedOutState());
        },
      );
    });
  }
}
