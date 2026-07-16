import 'package:dartz/dartz.dart';
import 'package:final_project/core/api/api_end_points.dart';
import 'package:final_project/core/api/dio_helper.dart';
import 'package:final_project/feature/home/data/models/address_model.dart';

class AddressRepo {
  final DioHelper _dioHelper;

  AddressRepo(this._dioHelper);

  Future<Either<String, List<AddressModel>>> getAllAddresses() async {
    final response = await _dioHelper.getRequest(ApiEndPoints.getAddresses);

    if (response.isSuccess) {
      final addresses = (response.data as List)
          .map((e) => AddressModel.fromJson(e))
          .toList();

      return Right(addresses);
    }

    return Left(
      response.errorMessage ??
          'Request failed (status: ${response.statusCode ?? 'unknown'})',
    );
  }
}