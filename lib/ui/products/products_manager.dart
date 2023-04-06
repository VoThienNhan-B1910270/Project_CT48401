//Quản lý các sản phẩm
import '../../models/product.dart';

class ProductsManager{
    final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Hoa Thỏ Bunny',
      description: 'Thỏ bunny gồm 11 bông hoa 7 lớp hoặc hoa nhũ. Hoa hồng sáp có mùi thơm nhẹ. Form 2 tầng cứng cáp, đứng thẳng. 100% tai thỏ dựng đứng được. Full lông 2 tầng.',
      price: 350,
      imageUrl:
        'https://scontent.fvca1-3.fna.fbcdn.net/v/t39.30808-6/334602282_1342779339788761_4832881737478778824_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=I2h5YwlS85MAX_Vk9C6&_nc_ht=scontent.fvca1-3.fna&oh=00_AfCuOY-gVjG6M2TJgTiDK_vUFjzpvxXHAxlk5yrOA_wazg&oe=64331A5F',
      isFavorite: true,
    ),
    Product(
      id: 'p2',
      title: 'Hoa vai nho',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.15752-9/333620039_191029126960448_2046996536971346353_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=ae9488&_nc_ohc=x2JX0Ju9MAsAX_j8KJf&_nc_ht=scontent.fvca1-2.fna&oh=03_AdT4lZynTzXUiggjvk0gfYV8EkpbQqeIHzGlpN3P4A63Pw&oe=64551A96',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
      isFavorite: true,
    ),
  ];

  int get itemCount{
    return _items.length;
  }

  List<Product> get items{
    return [..._items];
  }

  List<Product> get favoriteItems{
    return _items.where((item) => item.isFavorite).toList();
  }
}