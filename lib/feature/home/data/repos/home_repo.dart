import 'package:dartz/dartz.dart';
import 'package:final_project/core/api/api_end_points.dart';
import 'package:final_project/core/api/dio_helper.dart';
import 'package:final_project/feature/home/data/models/product_model.dart';

class HomeRepo {
  final DioHelper _dioHelper;
  HomeRepo(this._dioHelper);
  Future<Either<String, List<ProductModel>>> getAllProducts() async {
    List<ProductModel> products;
    final response = await _dioHelper.getRequest(ApiEndPoints.getProducts);
    if (response.isSuccess) {
      products = productModelFromJson(response.data);
      return Right(products);
    } else {
      final String msg =
          response.errorMessage ??
          'Request failed (status: ${response.statusCode ?? 'unknown'})';
      return Left(msg);
    }
  }

  Future<Either<String, List<ProductModel>>> searchProducts(String name) async {
    List<ProductModel> products;
    final response = await _dioHelper.getRequest("${ApiEndPoints.search}?q=$name");
    if (response.isSuccess) {
      products = productModelFromJson(response.data['products']);
      return Right(products);
    } else {
      final String msg =
          response.errorMessage ??
          'Request failed (status: ${response.statusCode ?? 'unknown'})';
      return Left(msg);
    }
  }
}