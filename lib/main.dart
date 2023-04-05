import 'package:flutter/material.dart';

import 'ui/products/products_manager.dart';
import 'ui/products/product_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thùy Dương Flower',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.yellow,
        ).copyWith(
          secondary: Colors.deepOrange,
        ),
      ),
      home: SafeArea(
        child: ProductDetailScreen(
          ProductsManager().items[0],
        ),
      ),
    );
  }
}