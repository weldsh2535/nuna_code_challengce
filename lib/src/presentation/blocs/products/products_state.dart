

import 'package:nuna_code_challenges/src/domain/models/products.dart';

abstract class ProductsState {}

class ProductsStateInital extends ProductsState {}
class ProductsStateLoading extends ProductsState {}
class ProductsStateSucess extends ProductsState {
   final Products data;
   ProductsStateSucess(this.data);
}

class ProductsStateState extends ProductsState {
  final List<Products> data;

  ProductsStateState(this.data);
}

class ProductsStateErrorState extends ProductsState {
  final String error;

  ProductsStateErrorState(this.error);
}
