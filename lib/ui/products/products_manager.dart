//Quản lý các sản phẩm
import 'package:b1910270_ct48401_project/models/auth_token.dart';
import 'package:b1910270_ct48401_project/services/products_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

import '../../models/product.dart';

class ProductsManager with ChangeNotifier{
    List<Product> _items = [];

    final ProductsService _productsSevice;
    // Product(
    //   id: 'p1',
    //   title: 'Hoa Thỏ Bunny',
    //   description: 'Thỏ bunny gồm 11 bông hoa 7 lớp hoặc hoa nhũ. Hoa hồng sáp có mùi thơm nhẹ. Form 2 tầng cứng cáp, đứng thẳng. 100% tai thỏ dựng đứng được. Full lông 2 tầng.',
    //   price: 350,
    //   imageUrl:
    //     'https://scontent.fvca1-3.fna.fbcdn.net/v/t39.30808-6/341624442_1686023628515511_6373112640932859449_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=0debeb&_nc_ohc=6xmMmHD7D5YAX-48G-5&_nc_ht=scontent.fvca1-3.fna&oh=00_AfCSwXPfy7oBZ9REQ3OcvwLylJQtzWTwUWzmJZGxHZkLBQ&oe=6441612F',
    //   isFavorite: true,
    // ),
    // Product(
    //   id: 'p2',
    //   title: 'Hoa Vải Nhỏ',
    //   description: 'Hoa vải nhỏ gồm 3 bông hoa vải và đi kèm với hoa là một ít đệm từ nhánh lá táo.',
    //   price: 200,
    //   imageUrl:
    //       'https://scontent.fvca1-4.fna.fbcdn.net/v/t39.30808-6/341575402_204108522361275_1149668506765508582_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=0debeb&_nc_ohc=oWhD9M4FL6EAX9XCOIM&_nc_ht=scontent.fvca1-4.fna&oh=00_AfCcCpK_m2AR5kiC5LCDDmtHUGal5Uv6J2lleLKpDMEKYQ&oe=643FF807',
    // ),
    // Product(
    //   id: 'p3',
    //   title: 'Hoa Gấu',
    //   description: 'Hoa gấu gồm 10 chú gấu xinh xắn. Xen kẻ những chú gấu là những vãi tuyết được cuộn một cách đẹp mắt. Đây là món quà tuyệt vời khi được tặng vào các dịp đặc biệt.',
    //   price: 350,
    //   imageUrl:
    //     'https://scontent.fvca1-2.fna.fbcdn.net/v/t39.30808-6/341640366_1655979858177274_4434472880721157232_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=0debeb&_nc_ohc=QfGpIXD_VuIAX9TeT_y&_nc_ht=scontent.fvca1-2.fna&oh=00_AfCnBifp5fHN2Z73nu-YTRx7w2FTab3b4U18_-ojHK1OTA&oe=644195A0',
    // ),
    // Product(
    //   id: 'p4',
    //   title: 'Bi Nhỏ',
    //   description: 'Prepare any meal you want.',
    //   price: 200,
    //   imageUrl:
    //       'https://scontent.fvca1-3.fna.fbcdn.net/v/t39.30808-6/341555318_757530862507140_7593706004427810212_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=0debeb&_nc_ohc=OyTASt7pYfwAX-O_9OF&_nc_ht=scontent.fvca1-3.fna&oh=00_AfAdntg5yDzAyz1g0fw8_uIcc4n6SEys4tEGJM7KpyCNlQ&oe=64402026',
    //   isFavorite: true,
    // ),
  //];

  int get itemCount{
    return _items.length;
  }

  List<Product> get items{
    return [..._items];
  }

  List<Product> get favoriteItems{
    return _items.where((item) => item.isFavorite).toList();
  }

  Product? findById(String id){
    try{
      return _items.firstWhere((item) => item.id == id);
    }catch  (error){
      return null;
    }
  }

  Future<void> addProduct(Product product) async {
    final newProduct = await _productsSevice.addProduct(product);
    if(newProduct != null){
      _items.add(newProduct);
      notifyListeners();
    }
  }

  Future<void> updateProduct(Product product) async {
    final index = _items.indexWhere((item) => item.id == product.id);
    if(index >= 0){
      if(await _productsSevice.updateProduct(product)){
        _items[index] = product;
        notifyListeners();
      }
    }
  }

  Future<void> toggleFavoriteStatus(Product product) async {
    final savedStatus = product.isFavorite;
    product.isFavorite = !savedStatus;

    if(!await _productsSevice.saveFavoriteStatus(product)){
      product.isFavorite = savedStatus;
    }
  }

  Future<void> deleteProduct(String id) async {
    final index = _items.indexWhere((item) => item.id == id);
    Product? existingProduct = _items[index];
    _items.removeAt(index);
    notifyListeners();

    if(!await _productsSevice.deleteProduct(id)){
      _items.insert(index, existingProduct);
      notifyListeners();
    }
  }

  ProductsManager([AuthToken? authToken])
    : _productsSevice = ProductsService(authToken);

  set authToken(AuthToken? authToken){
    _productsSevice.authToken = authToken;
  }

  Future<void> fetchProducts([bool filterByUser = false]) async {
    _items = await _productsSevice.fetchProducts(filterByUser);
    notifyListeners();
  }
}