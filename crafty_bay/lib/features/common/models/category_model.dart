class CategoryModel {
  final String id;
  final String title;
  final String iconUrl;

  CategoryModel({required this.id, required this.title, required this.iconUrl});

  factory CategoryModel.fromJson(Map<String, dynamic> jsonData) {
    return CategoryModel(
      id: jsonData['_id'],
      title: jsonData['title'],
      iconUrl: jsonData['icon'],
    );
  }
}