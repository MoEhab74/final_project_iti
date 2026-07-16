import 'package:final_project/core/utils/service_locator.dart';
import 'package:final_project/feature/home/data/repos/home_repo.dart';
import 'package:final_project/feature/home/presentation/cubit/products/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitialState());

  Future<void> getAllProducts() async {
    emit(ProductsLoadingState());

    final result = await locator<HomeRepo>().getAllProducts();

    result.fold(
      (error) => emit(ProductsFailureState(error)),
      (products) => emit(ProductsSuccessState(products)),
    );
  }

  Future<void> searchProducts(String name) async {
    emit(ProductsLoadingState());

    final result = await locator<HomeRepo>().searchProducts(name);

    result.fold(
      (error) => emit(ProductsFailureState(error)),
      (products) => emit(ProductsSuccessState(products)),
    );
  }

  void clearSearch() {
    emit(ProductsInitialState());
  }
}
