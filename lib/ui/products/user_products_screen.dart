//Định nghĩa trang hiển thị các sản phẩm của người dùng
import 'package:b1910270_ct48401_project/ui/screens.dart';
import 'package:b1910270_ct48401_project/ui/shared/app_drawer.dart';
import 'package:flutter/material.dart';
import 'products_manager.dart';
import 'user_product_list_tile.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget{
  static const routeName = '/user-products';
  const UserProductsScreen({super.key});

  Future<void> _refreshProducts(BuildContext context) async {
    await context.read<ProductsManager>().fetchProducts(true);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cập Nhật Sản Phẩm'),
        actions: <Widget>[
          buildAddButton(context),
        ],
      ),
      drawer: const AppDrawer(),
      body: 
      // FutureBuilder(
      //   future:  _refreshProducts(context),
      //   builder: (ctx, snapshot){
      //     if(snapshot.connectionState == ConnectionState.waiting){
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     return RefreshIndicator(
      //       onRefresh: () => _refreshProducts(context),
      //       child: buildUserProductListView(),
      //     );
      //   },
      // )
      RefreshIndicator(
        onRefresh: () async => print('Refresh products'),
        child: buildUserProductListView(),
      )
    );
  }

  Widget buildUserProductListView(){
    return Consumer<ProductsManager>(
      builder: (ctx, productsManager, child){
        return ListView.builder(
          itemCount: productsManager.itemCount,
          itemBuilder: (ctx,i) => Column(
            children: [
              UserProductListTile(productsManager.items[i]),
              const Divider(),
            ],
          ),
        );
      }
    );
  }

  Widget buildAddButton(BuildContext context){
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: (){
        Navigator.of(context).pushNamed(
          EditProductScreen.routeName,
        );
      },
    );
  }
}