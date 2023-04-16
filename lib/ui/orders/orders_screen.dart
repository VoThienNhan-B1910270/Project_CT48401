//Định nghĩa trang hiển thị thông tin các đặt hàng
import 'package:b1910270_ct48401_project/ui/shared/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

import 'order_manager.dart';
import 'order_item_card.dart';

class OrdersScreen extends StatelessWidget{
  static const routeName = '/orders';
  const OrdersScreen ({super.key});

  @override
  Widget build(BuildContext context){
    print('Building Order');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giỏ Hàng'),
      ),
      drawer: const AppDrawer(),
      body: Consumer<OrderManager>(
        builder: (ctx, ordersManager, child){
          return ListView.builder(
            itemCount: ordersManager.orderCount,
            itemBuilder: (ctx,i) => OrderItemCard(ordersManager.orders[i]),
          );
        }
      ),
    );
  }
}