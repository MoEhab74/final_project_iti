import 'package:final_project/core/utils/service_locator.dart';
import 'package:final_project/feature/home/data/repos/home_repo.dart';
import 'package:final_project/feature/home/presentation/cubit/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSCubit extends Cubit<ProductsState> {
  ProductSCubit() : super(ProductsInitialState());

  Future<void> getAllProducts() async {
    emit(ProductsLoadingState());

    final result = await locator<HomeRepo>().getAllProducts();

    result.fold(
      (error) => emit(ProductsFailureState(error)),
      (products) => emit(ProductsSuccessState(products)),
    );
  }
}