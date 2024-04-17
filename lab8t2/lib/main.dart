import 'package:flutter/material.dart';
import 'package:lab8t2/models/product_model.dart';

import 'view_models/product_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVVM Demo',
      home: CatalogScreen(),
    );
  }
}

class CatalogScreen extends StatefulWidget {
  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  late Product _product;

  @override
  void initState() {
    super.initState();
    fetchProduct();
  }

  Future<void> fetchProduct() async {
    final viewModel = ProductViewModel();
    final product = await viewModel.fetchProduct();
    setState(() {
      _product = product;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
      ),
      body: _product == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Image.network(_product.image),
                SizedBox(height: 20),
                Text(_product.title),
                Text(_product.description),
                Text('\$${_product.price}'),
                ElevatedButton(
                  onPressed: () {
                    // Implement adding product to basket functionality
                  },
                  child: Text('Add to Basket'),
                ),
              ],
            ),
    );
  }
}
