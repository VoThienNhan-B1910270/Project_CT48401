//Định nghĩa trang hiển thị các sản phẩm của người dùng
import 'package:b1910270_ct48401_project/ui/shared/app_drawer.dart';
import 'package:flutter/material.dart';
import 'products_manager.dart';
import 'user_product_list_tile.dart';

class UserProductsScreen extends StatelessWidget{
  static const routeName = '/user-products';
  const UserProductsScreen({super.key});

  @override
  Widget build(BuildContext context){
    final productsManager = ProductsManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cập Nhật Sản Phẩm'),
        actions: <Widget>[
          buildAddButton(),
        ],
      ),
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () async => print('Refresh Product'),
        child: buildUserProductListView(productsManager),
      ),
    );
  }

  Widget buildUserProductListView(ProductsManager productsManager){
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

  Widget buildAddButton(){
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: (){
        print('Go to edit product screen');
      },
    );
  }
}