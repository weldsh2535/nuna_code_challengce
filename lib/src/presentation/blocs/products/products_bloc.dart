import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuna_code_challenges/src/data/repository/product_repository.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/products/products_event.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/products/products_state.dart';


class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository productsRepository;
  ProductsBloc({required this.productsRepository}) : super(ProductsStateInital()) {
    on<FetchDataEvent>(_onFetchData);
  }

  Future<void> _onFetchData(
      FetchDataEvent event, Emitter<ProductsState> emit) async {
    emit(ProductsStateLoading());
    try {
      emit(ProductsStateLoading());
      final products = await productsRepository.fetchProducts();
      // //print("object  ${response.first}");
      if (products.products.isNotEmpty) {
        emit(ProductsStateSucess(products));
      } else {
        emit(ProductsStateErrorState("Failed to try again"));
      }
    } catch (e) {
      emit(ProductsStateErrorState("Failed to try again"));
    }

  }
}
