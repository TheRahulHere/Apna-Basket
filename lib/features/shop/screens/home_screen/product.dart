class Product {
  final String id;
  final String name;
  final String image;
  final double price;
  bool isFavourite;
  final String category;
  bool isAddedToBasket;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.isFavourite = false,
    required this.category,
    this.isAddedToBasket=false
  });

  factory Product.fromFirestore(Map<String, dynamic> data, String id) {
    return Product(
      id: id,
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      isFavourite: data['isFavourite'] ?? false,
      category:  data['category'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'isFavourite': isFavourite,
      'category' : category,
    };
  }
}


