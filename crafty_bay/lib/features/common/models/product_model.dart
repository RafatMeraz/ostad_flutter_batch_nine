class ProductModel {
  final String id;
  final String title;
  final int currentPrice;
  final List<String> photoUrls;

  ProductModel({
    required this.id,
    required this.title,
    required this.currentPrice,
    required this.photoUrls,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    List<String> l = [];
    for (String s in jsonData['photos']) {
      l.add(s);
    }
    return ProductModel(
      id: jsonData['_id'],
      title: jsonData['title'],
      currentPrice: jsonData['current_price'],
      photoUrls: List<String>.from(jsonData['photos']),
    );
  }
}
