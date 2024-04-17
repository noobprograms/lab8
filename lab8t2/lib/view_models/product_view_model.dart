import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lab8t2/models/product_model.dart';

class ProductViewModel {
  Future<Product> fetchProduct() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products/1'));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return Product.fromJson(json);
    } else {
      throw Exception('Failed to load product');
    }
  }
}
