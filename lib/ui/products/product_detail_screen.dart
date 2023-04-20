//Định nghĩa trang thông tin chi tiết sản phẩm
import '../screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  const ProductDetailScreen(
    this.product, {
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        actions: <Widget>[
          buildFivorite(),
          buildShoppingCartIcon(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 450,
              width: double.infinity,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${product.price.toStringAsFixed(0)}.000đ',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                product.description,
                textAlign: TextAlign.left,
                softWrap: true,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          final cart = context.read<CartManager>();
          cart.addItem(product);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: const Text(
                  'Thêm sản phẩm vào giỏ hàng',
                ),
                duration: const Duration(seconds: 2),
                action: SnackBarAction(
                  label: 'UNDO',
                  onPressed: () {
                    cart.removeSingleItem(product.id!);
                  },
                ),
              ),
            );
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.blueGrey, // Màu nền của nút
          onPrimary: Colors.white, // Màu chữ trên nút
          shape: const RoundedRectangleBorder(
            // borderRadius: BorderRadius.circular(8), // Độ cong của viền
            side: BorderSide(color: Colors.blueGrey), // Đường viền của nút
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 16), // Khoảng cách giữa nội dung và viền
        ),
        child: const Text(
          'Mua hàng',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ), // Nội dung của nút
      ),
    );
  }

  Widget buildFivorite() {
    return ValueListenableBuilder<bool>(
      valueListenable: product.isFavoriteListenable,
      builder: (ctx, isFavorite, child) {
        return IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
          ),
          // color: Colors.red,
          onPressed: () {
            ctx.read<ProductsManager>().toggleFavoriteStatus(product);
          },
        );
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
              Navigator.of(ctx).pushNamed(CartScreen.routeName);
            },
          ),
        );
      }
    );
  }
}