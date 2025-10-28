import 'package:news_app_hti_online/core/assets_manager.dart';

class CategoryModel{
  String id;
  String name;
  String imagePath;
  CategoryModel({required this.id, required this.name, required this.imagePath});
  static List<CategoryModel> categories = [
    CategoryModel(id: "general", name: "General", imagePath: ImageAssets.general),
    CategoryModel(id: "sports", name: "Sports", imagePath: ImageAssets.sports),
    CategoryModel(id: "health", name: "Health", imagePath: ImageAssets.health),
    CategoryModel(id: "science", name: "Science", imagePath: ImageAssets.science),
    CategoryModel(id: "technology", name: "Technology", imagePath: ImageAssets.technology),
    CategoryModel(id: "entertainment", name: "Entertainment", imagePath: ImageAssets.entertainment),
    CategoryModel(id: "business", name: "business", imagePath: ImageAssets.business),
  ];
}