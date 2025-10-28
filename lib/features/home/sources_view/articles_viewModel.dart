import 'package:flutter/material.dart';
import 'package:news_app_hti_online/api/api_service.dart';
import 'package:news_app_hti_online/api/articles_response/Article.dart';
import 'package:news_app_hti_online/api/sources_response/Source.dart';

class ArticlesViewModel extends ChangeNotifier{
  List<Article> articles =[];
  bool isLoading = false;
  String? errorMessage;

  void fetchArticles(Source source)async{
    isLoading = true;
    notifyListeners();
    var result = await ApiService.getArticles(source);
    isLoading = false;
    notifyListeners();
    result.fold((message){
      errorMessage = message;
    }, (articlesList){
      articles = articlesList;
    });
    notifyListeners();
  }
}