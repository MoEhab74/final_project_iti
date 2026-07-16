import 'package:final_project/feature/cart/data/models/cart_model.dart';

class CartStates {}

class CartInitial extends CartStates {}

class GetCartLoading extends CartStates {}

class GetCartSuccess extends CartStates {
  final List<CartModel> carts;
  GetCartSuccess(this.carts);
}

class GetCartError extends CartStates {
  final String errorMessage;
  GetCartError(this.errorMessage);
}
