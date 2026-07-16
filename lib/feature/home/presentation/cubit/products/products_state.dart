abstract class ProductsState{

}

class ProductsInitialState extends ProductsState{

}

class ProductsLoadingState extends ProductsState{

}

class ProductsSuccessState extends ProductsState{
  final List<dynamic> products;

  ProductsSuccessState(this.products);
}

class ProductsFailureState extends ProductsState{
  final String errorMessage;

  ProductsFailureState(this.errorMessage);
}