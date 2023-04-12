//Định nghĩa lớp OrderManager quản lý các đặt hàng
import 'package:flutter/widgets.dart';

import '../../models/cart_item.dart';
import '../../models/order_item.dart';

class OrderManager with ChangeNotifier{
  final List<OrderItem> _orders = [
    OrderItem(
      id: 'o1',
      amount: 59.98,
      products: [
        CartItem(
          id: 'c1',
          title: 'Bông Bi Nhỏ',
          quantity: 2,
          price: 400,
        )
      ],
      dateTime: DateTime.now(),
    )
  ];

  int get orderCount{
    return _orders.length;
  }

  List<OrderItem> get orders{
    return [..._orders];
  }
}