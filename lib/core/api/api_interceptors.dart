import 'dart:async';
import 'package:dio/dio.dart';
import 'package:final_project/core/utils/secure_local_storage.dart';
import 'package:final_project/core/utils/service_locator.dart';

class ApiInterceptors extends Interceptor {
  final Dio dio;
  static Completer<
    bool
  >? 
  _refreshCompleter;
  ApiInterceptors(this.dio);
  @override
void onRequest(
  RequestOptions options,
  RequestInterceptorHandler handler,
) async {
  final secureStorage = locator<SecureLocalStorageHelper>();
  final accessToken = await secureStorage.readData('accessToken');

  if (accessToken != '0') {
    options.headers['Authorization'] = 'Bearer $accessToken';
  }

  super.onRequest(options, handler);
} 
   @override
void onError(DioException err, ErrorInterceptorHandler handler) async {
  if (err.response?.statusCode == 401) {
    await _performLogout();
  }

  return super.onError(err, handler);
}
 

  Future<void> _performLogout() async {
  await locator<SecureLocalStorageHelper>().deleteData('accessToken');
await locator<SecureLocalStorageHelper>().deleteData('refreshToken');
    AuthEventBus.instance.addEvent(
      AuthEvent.logout,
    ); 
  }
}

enum AuthEvent {
  logout,
} 

class AuthEventBus {
  AuthEventBus._();
  static final AuthEventBus instance = AuthEventBus._();

  final _controller =
      StreamController<
        AuthEvent
      >.broadcast();

  Stream<AuthEvent> get stream => _controller.stream;

  void addEvent(AuthEvent event) {
    if (!_controller.isClosed) {
      _controller.add(event);
    }
  }

  void dispose() => _controller.close();
}