//Định nghĩa lớp CartItem miêu tả thông tin một mặt hàng trong giỏ hàng
class CartItem{
  final String id;
  final String title;
  final int quantity;
  final num price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });

  CartItem copyWith({
    String? id,
    String? title,
    int? quantity,
    num? price,
  })  {
    return CartItem(
      id: id ?? this.id,
      title: title ?? this.title,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }
}