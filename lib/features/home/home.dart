import 'package:flutter/material.dart';
import 'package:news_app_hti_online/features/home/categories_view/categories_view.dart';
import 'package:news_app_hti_online/features/home/sources_view/sources_view.dart';
import 'package:news_app_hti_online/models/category_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 late  Widget homeView = CategoriesView(onCategoryItemClicked: onCategoryItemClicked,);

String title = "Home";
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body:homeView
    );
  }


  void onCategoryItemClicked(CategoryModel category){
    setState(() {
      title = category.name;
      homeView = SourcesView();
    });
  }
}
