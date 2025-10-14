import 'package:news_app_hti_online/core/assets_manager.dart';

class CategoryModel{
  String id;
  String name;
  String imagePath;
  CategoryModel({required this.id, required this.name, required this.imagePath});
  static List<CategoryModel> categories = [
    CategoryModel(id: "id", name: "General", imagePath: ImageAssets.general),
    CategoryModel(id: "id", name: "Sports", imagePath: ImageAssets.sports),
    CategoryModel(id: "id", name: "Health", imagePath: ImageAssets.health),
    CategoryModel(id: "id", name: "Science", imagePath: ImageAssets.science),
    CategoryModel(id: "id", name: "Technology", imagePath: ImageAssets.technology),
    CategoryModel(id: "id", name: "Entertainment", imagePath: ImageAssets.entertainment),
    CategoryModel(id: "id", name: "business", imagePath: ImageAssets.business),
  ];
}