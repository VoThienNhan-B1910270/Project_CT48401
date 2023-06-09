//Định nghĩa widget CartItemCard hiển thị thông tin một mặt hàng trong giỏ hàng
import 'package:b1910270_ct48401_project/ui/cart/cart_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/cart_item.dart';
import '../shared/dialog_utils.dart';

class CartItemCard extends StatelessWidget{
  final String productId;
  final CartItem cardItem;

  const CartItemCard({
    required this.productId,
    required this.cardItem,
    super.key,
  });

  @override
  Widget build(BuildContext context){
    return Dismissible(
      key: ValueKey(cardItem.id),
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction){
        return showConfirmDialog(context, 'Bạn muốn xóa sản phẩm khỏi giỏ hàng?');
      },
      onDismissed: (direction){
        context.read<CartManager>().removeItem(productId);
      },
      child: buildItemCard(),
    );
  }

  Widget buildItemCard(){
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: FittedBox(
                child: Text('${cardItem.price.toStringAsFixed(0)}.000đ'),
              ),
            ),
          ),
          title: Text(cardItem.title),
          subtitle: Text('Total: ${(cardItem.price * cardItem.quantity).toStringAsFixed(0)}.000đ'),
          trailing: Text('${cardItem.quantity}x'),
        ),
      ),
    );
  }
}