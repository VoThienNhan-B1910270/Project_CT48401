//Định nghĩa widget AppDrawer thực hiện điều hướng trong ứng dụng
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth/auth_manager.dart';
import '../orders/orders_screen.dart';
import '../products/user_products_screen.dart';

class AppDrawer extends StatelessWidget{
  const AppDrawer ({super.key});

  @override
  Widget build(BuildContext context){
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            leading: const Icon(Icons.person, size: 40),
            title: const Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          const Divider(
            height: 10,
            indent: 10,
            endIndent: 10,
            color: Colors.black,
          ),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Shop', style: TextStyle( fontSize: 20),),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(
            height: 10,
            indent: 10,
            endIndent: 10,
            color: Colors.black,
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Giỏ Hàng', style: TextStyle( fontSize: 20),),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
            },
          ),
          const Divider(
            height: 10,
            indent: 10,
            endIndent: 10,
            color: Colors.black,
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Quản Lí Sản Phẩm', style: TextStyle( fontSize: 20),),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
          const Divider(
            height: 10,
            indent: 10,
            endIndent: 10,
            color: Colors.black,
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Đăng Xuất", style: TextStyle( fontSize: 20)),
            onTap: (){
              Navigator.of(context)
                ..pop()
                ..pushReplacementNamed('/');
              context.read<AuthManager>().logout();
            },
          )
        ],
      ),
    );
  }
}