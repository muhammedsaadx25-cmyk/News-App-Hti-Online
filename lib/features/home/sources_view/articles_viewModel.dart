import 'package:flutter/material.dart';
import 'package:news_app_hti_online/data/api/api_service.dart';
import 'package:news_app_hti_online/data/api/articles_response/Article.dart';
import 'package:news_app_hti_online/data/api/sources_response/Source.dart';
import 'package:news_app_hti_online/repositories/articles_repository.dart';

class ArticlesViewModel extends ChangeNotifier{
  ArticlesRepository articlesRepository;
  ArticlesViewModel({required this.articlesRepository});
  List<Article> articles =[];
  bool isLoading = false;
  String? errorMessage;

  void fetchArticles(Source source)async{
    isLoading = true;
    notifyListeners();
    var result = await articlesRepository.getArticles(source);
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