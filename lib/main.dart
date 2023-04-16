import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsManager(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartManager(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => OrderManager(),
        ),
      ],
      child: MaterialApp(
        title: 'Thùy Dương Flower',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blueGrey,
          ).copyWith(
            secondary: Colors.deepOrange,
          ),
        ),
        home: const ProductsOverviewScreen(),
        routes: {
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrdersScreen.routeName: (ctx) => const OrdersScreen(),
          UserProductsScreen.routeName: (ctx) => const UserProductsScreen(),
        },
        onGenerateRoute: (settings){
          if(settings.name == ProductDetailScreen.routeName){
            final productId = settings.arguments as String;
            return MaterialPageRoute(
              builder: (ctx){
                // return ProductDetailScreen(
                //   ProductsManager.findById(productId)!,
                // );
                return ProductDetailScreen(
                  ctx.read<ProductsManager>().findById(productId)!,
                );
              },
            );
          }
          return null;
        },
      ),
    );
  }
}