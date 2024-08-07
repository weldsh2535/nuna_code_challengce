import 'package:nuna_code_challenges/src/data/data_soucres/product_provider.dart';
import 'package:nuna_code_challenges/src/domain/models/products.dart';

class ProductsRepository{
  ProductDataProvider productDataProvider;
  ProductsRepository({required this.productDataProvider});
  Future<Products> fetchProducts() async {
    return productDataProvider.fetchProducts();
  }
}