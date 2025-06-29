class SliderModel {
  final String id;
  final String photoUrl;
  final String description;
  final String brandId;

  SliderModel({
    required this.id,
    required this.photoUrl,
    required this.description,
    required this.brandId,
  });

  factory SliderModel.fromJson(Map<String, dynamic> jsonData) {
    return SliderModel(
      id: jsonData['id'] ?? '',
      photoUrl: jsonData['photo_url'],
      description: jsonData['description'],
      brandId: jsonData['brand'],
    );
  }
}
