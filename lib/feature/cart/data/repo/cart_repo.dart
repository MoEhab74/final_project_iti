import 'package:dartz/dartz.dart';
import 'package:final_project/core/api/api_end_points.dart';
import 'package:final_project/core/api/dio_helper.dart';
import 'package:final_project/feature/cart/data/models/cart_model.dart';

class CartRepo {
  final DioHelper _dioHelper;
  CartRepo(this._dioHelper);
  Future<Either<String, List<CartModel>>> getUserCart() async {
    final response = await _dioHelper.getRequest(ApiEndPoints.getCart);
    if (response.isSuccess) {
      final carts = CartResponseModel.fromJson(response.data).carts;
      return Right(carts);
    } else {
      
      final String msg =
          response.errorMessage ??
          'Request failed (status: ${response.statusCode ?? 'unknown'})';
      return Left(msg);
    }
  }
}