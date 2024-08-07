import 'dart:convert';
import 'package:nuna_code_challenges/src/core/constants/api_constants.dart';
import 'package:nuna_code_challenges/src/domain/models/products.dart';
import "package:http/http.dart" as http;

class ProductDataProvider {
  Future<Products> fetchProducts() async {
    try {
      final response =
          await http.get(Uri.parse('${ApiConstants.baseAPIUrl}/products'));

      if (response.statusCode == 200) {
        return Products.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
            'Failed to load products. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching products: $e');
      throw Exception('Failed to fetch products: $e');
    }
  }
}
