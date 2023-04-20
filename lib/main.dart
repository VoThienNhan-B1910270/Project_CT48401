import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'ui/screens.dart';

Future<void> main() async{
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthManager(),
        ),
        ChangeNotifierProxyProvider<AuthManager, ProductsManager>(
          create: (ctx) => ProductsManager(),
          update: (ctx, authManager, productsManager){
            productsManager!.authToken = authManager.authToken;
            return productsManager;
          },
        ),
        ChangeNotifierProvider(create: (ctx) => CartManager()),
        ChangeNotifierProvider(create: (ctx) => OrderManager()),
      ],
      child: Consumer<AuthManager>(
        builder: (context, authManager, child){
          return MaterialApp(
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
            home: 
            authManager.isAuth
              ? const ProductsOverviewScreen()
              : FutureBuilder(
                future: authManager.tryAutoLogin(),
                builder: (ctx, snapshot){
                  return snapshot.connectionState == ConnectionState.waiting
                    ? const SplashScreen()
                    : const AuthScreen();
                },
              ),
            // const ProductsOverviewScreen(),
            routes: {
              CartScreen.routeName: (ctx) => const CartScreen(),
              OrdersScreen.routeName: (ctx) => const OrdersScreen(),
              UserProductsScreen.routeName: (ctx) => const UserProductsScreen(),
            },
            onGenerateRoute: (settings){
              if(settings.name == EditProductScreen.routeName){
                final productId = settings.arguments as String?;
                return MaterialPageRoute(
                  builder: (ctx){
                    return EditProductScreen(
                      productId != null
                      ? ctx.read<ProductsManager>().findById(productId) : null,
                    );
                  },
                );
              }
              
              if(settings.name == ProductDetailScreen.routeName){
                final productId = settings.arguments as String;
                return MaterialPageRoute(
                  builder: (ctx){
                    return ProductDetailScreen(
                      ctx.read<ProductsManager>().findById(productId)!,
                    );
                  },
                );
              }
              return null;
            },
          );
        }
      ),
    );
  }
}