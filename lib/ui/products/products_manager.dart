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
        // 'https://scontent.fvca1-3.fna.fbcdn.net/v/t39.30808-6/334602282_1342779339788761_4832881737478778824_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=I2h5YwlS85MAX_Vk9C6&_nc_ht=scontent.fvca1-3.fna&oh=00_AfCuOY-gVjG6M2TJgTiDK_vUFjzpvxXHAxlk5yrOA_wazg&oe=64331A5F',
        'https://scontent.fvca1-3.fna.fbcdn.net/v/t39.30808-6/334602282_1342779339788761_4832881737478778824_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=nMkd9AewhLIAX8lst7U&_nc_ht=scontent.fvca1-3.fna&oh=00_AfC00Q70_-iDnOlNJbYHvrJW3m111IxD15k_zYY6YS8-Bw&oe=643EF7DF',
      isFavorite: true,
    ),
    Product(
      id: 'p2',
      title: 'Hoa Vải Nhỏ',
      description: 'Hoa vải nhỏ gồm 3 bông hoa vải và đi kèm với hoa là một ít đệm từ nhánh lá táo.',
      price: 200,
      imageUrl:
          'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.15752-9/333620039_191029126960448_2046996536971346353_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=ae9488&_nc_ohc=x2JX0Ju9MAsAX_j8KJf&_nc_ht=scontent.fvca1-2.fna&oh=03_AdT4lZynTzXUiggjvk0gfYV8EkpbQqeIHzGlpN3P4A63Pw&oe=64551A96',
    ),
    Product(
      id: 'p3',
      title: 'Hoa Gấu',
      description: 'Hoa gấu gồm 10 chú gấu xinh xắn. Xen kẻ những chú gấu là những vãi tuyết được cuộn một cách đẹp mắt. Đây là món quà tuyệt vời khi được tặng vào các dịp đặc biệt.',
      price: 350,
      imageUrl:
        'https://scontent.fvca1-1.fna.fbcdn.net/v/t39.30808-6/334463238_137539369231395_1902763790119435642_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=Dy15oiHSdjAAX9Jg3t_&_nc_ht=scontent.fvca1-1.fna&oh=00_AfCPmSosyTXrOMRTwhOz4JIpVmPw6mKAj7JVtq8SqN-aDw&oe=643FF932',
    ),
    Product(
      id: 'p4',
      title: 'Bi Nhỏ',
      description: 'Prepare any meal you want.',
      price: 200,
      imageUrl:
          // 'https://scontent.fvca1-4.fna.fbcdn.net/v/t39.30808-6/334567776_597753175166209_2667319389644973654_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=vDKtAHGmGPkAX8HrI5j&_nc_ht=scontent.fvca1-4.fna&oh=00_AfBbUjvaKuBaPCKRVdSKJsY5dA_ET4ityM-LyYu7HqFgbA&oe=6433FC7F',
          'https://scontent.fvca1-2.fna.fbcdn.net/v/t39.30808-6/334674067_1434242090717940_980253751207705395_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=Y9SvpWj-iAwAX8NO9-k&_nc_ht=scontent.fvca1-2.fna&oh=00_AfBCWUyqEhH3I0df01XOVMeNcKjTaNLEU45t3MjaAEAt-Q&oe=643EA32A',
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

  Product? findById(String id){
    try{
      return _items.firstWhere((item) => item.id == id);
    }catch  (error){
      return null;
    }
  }
}