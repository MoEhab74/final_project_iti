import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/feature/cart/data/repo/cart_repo.dart';
import 'package:final_project/feature/cart/presentation/cubit/cart_states.dart';
import 'package:final_project/core/utils/service_locator.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitial());
  Future<void> getUserCart() async {
    final cartRepo = locator<CartRepo>();
    emit(GetCartLoading());
    final result = await cartRepo.getUserCart();
    result.fold(
      (error) => emit(GetCartError(error)),
      (carts) => emit(GetCartSuccess(carts)),
    );
  }
}