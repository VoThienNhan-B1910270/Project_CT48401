//Định nghĩa trang tổng quan các sản phẩm
import 'package:b1910270_ct48401_project/ui/cart/cart_screen.dart';
import 'package:b1910270_ct48401_project/ui/products/products_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'products_grid.dart';
import '../shared/app_drawer.dart';
import '../cart/cart_manager.dart';
import 'top_right_badge.dart';

enum FilterOptions { favorites, all}

class ProductsOverviewScreen extends StatefulWidget{
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen>{
  final _showOnlyFavorites = ValueNotifier<bool>(false);
  late Future<void> _fetchProducts;

  @override
  void initState(){
    super.initState();
    _fetchProducts = context.read<ProductsManager>().fetchProducts();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thùy Dương Flower', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        actions: <Widget>[
          buildProductFilterMenu(),
          buildUser(),
          buildShoppingCartIcon(),
        ],
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: _fetchProducts,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return ValueListenableBuilder<bool>(
              valueListenable: _showOnlyFavorites,
              builder: (context, onlyFavorites, child){
                return ProductsGrid(onlyFavorites);
              }
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget buildUser(){
    return IconButton(
      icon: const Icon(Icons.person_outline_outlined),
      onPressed: (){
      },
    );
  }

  Widget buildShoppingCartIcon(){
    return Consumer<CartManager>(
      builder: (ctx, cartManager, child){
        return TopRightBadge(
          data: cartManager.productCount,
          child: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: (){
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
          ),
        );
      }
    );
  }

  Widget buildProductFilterMenu(){
    return PopupMenuButton(
      onSelected: (FilterOptions selectedValue){
        setState(() {
          if (selectedValue == FilterOptions.favorites){
            _showOnlyFavorites.value = true;
          }else{
            _showOnlyFavorites.value = false;
          }
        });
      },
      icon: const Icon(Icons.more_vert),
      itemBuilder: (ctx) => [
        const PopupMenuItem(
          value: FilterOptions.favorites,
          child: Text('Only Favorite'),
        ),
        const PopupMenuItem(
          value: FilterOptions.all,
          child: Text('Show All'),
        ),
      ],
    );
  }
}