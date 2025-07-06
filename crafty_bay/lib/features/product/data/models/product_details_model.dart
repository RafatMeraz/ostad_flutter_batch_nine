class ProductDetailsModel {
  final String id;
  final String title;
  final String description;
  final List<String> colors;
  final List<String> sizes;
  final int currentPrice;
  final List<String> photoUrls;

  ProductDetailsModel({
    required this.id,
    required this.title,
    required this.currentPrice,
    required this.photoUrls,
    required this.description,
    required this.colors,
    required this.sizes,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductDetailsModel(
      id: jsonData['_id'],
      title: jsonData['title'],
      currentPrice: jsonData['current_price'],
      description: jsonData['description'] ?? '',
      photoUrls: List<String>.from(jsonData['photos']),
      colors: List<String>.from(jsonData['colors']),
      sizes: List<String>.from(jsonData['sizes']),
    );
  }
}
