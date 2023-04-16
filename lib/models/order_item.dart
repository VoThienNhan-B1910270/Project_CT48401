//Định nghĩa lớp OrderItem miêu tả thông tin một đặt hàng
import 'cart_item.dart';

class OrderItem{
  final String? id;
  final num amount;
  final List<CartItem> products;
  final DateTime dateTime;

  int get productCount{
    return products.length;
  }

  OrderItem({
    this.id,
    required this.amount,
    required this.products,
    DateTime? dateTime,
  })  : dateTime = dateTime ?? DateTime.now();

  OrderItem copyWith({
    String? id,
    num? amount,
    List<CartItem>? products,
    DateTime? dateTime,
  })  {
    return OrderItem(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      products: products ?? this.products,
      dateTime: dateTime ?? this.dateTime,
    );
  }
}