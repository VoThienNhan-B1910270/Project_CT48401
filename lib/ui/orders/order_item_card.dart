//Định nghĩa widget OrderItemCard hiển thị thông tin một đặt hàng
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/order_item.dart';

class OrderItemCard extends StatefulWidget{
  final OrderItem order;

  const OrderItemCard(this.order, {super.key});

  @override
  State<OrderItemCard> createState() => _OrderItemCardState();
}

class _OrderItemCardState extends State<OrderItemCard>{
  var _expanded = false;

  @override
  Widget build(BuildContext context){
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          buildOrderSummary(),
          if(_expanded) buildOrderDetails(),
          // if(_expanded) buildRemove()
        ],
      ),
    );
  }

  // Widget buildRemove(){
  //   return const Icon(Icons.delete);
  // }

  Widget buildOrderDetails(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      height: min(widget.order.productCount * 20.0 + 10, 100),
      child: ListView(
        children: widget.order.products
          .map(
            (prod) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  prod.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${prod.quantity}x ${prod.price.toStringAsFixed(0)}.000đ',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          )
        .toList(),
      ),
    );
  }

  Widget buildOrderSummary(){
    return ListTile(
      title: Text('${widget.order.amount.toStringAsFixed(0)}.000đ'),
      subtitle: Text(
        DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
      ),
      trailing: IconButton(
        icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
        onPressed: (){
          setState(() {
            _expanded = !_expanded;
          });
        },
      ),
    );
  }
}