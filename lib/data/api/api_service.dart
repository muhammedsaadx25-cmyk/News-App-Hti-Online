import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:news_app_hti_online/data/api/articles_response/Article.dart';
import 'package:news_app_hti_online/data/api/articles_response/ArticlesResponse.dart';
import 'package:news_app_hti_online/data/api/sources_response/Source.dart';
import 'package:news_app_hti_online/models/category_model.dart';
import 'package:http/http.dart' as http;

import 'sources_response/SourcesResponse.dart';
class ApiService{
  static const String baseURL = "newsapi.org";
  static const String apiKey = "811d8ca53d0d4ff281843e66552efcee";
  static const String sourcesEndPoint = "/v2/top-headlines/sources";
  static const String articlesEndPoint = "/v2/everything";
   Future<Either<String, List<Source>>> getSources(CategoryModel category)async{
    Uri url = Uri.https(baseURL, sourcesEndPoint,{
      "apiKey":apiKey,
      "category":category.id,
    });
   http.Response serverResponse = await http.get(url);
  var json =  jsonDecode(serverResponse.body);
  SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
  if(sourcesResponse.status == "error"){
    return left(sourcesResponse.message??'');
  }else{
    return  right(sourcesResponse.sources ?? []);
  }

  }
  
  ///https://newsapi.org/v2/everything?q=bitcoin&apiKey=811d8ca53d0d4ff281843e66552efcee
    Future<Either<String, List<Article>>>getArticles(Source source)async{
    Uri url = Uri.http(baseURL, articlesEndPoint, {
      "apiKey":apiKey,
      "sources":source.id,
    });
   http.Response serverResponse = await  http.get(url);
   var json = jsonDecode(serverResponse.body);
   ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
   if(articlesResponse.status == "error"){
     return left(articlesResponse.message??'');
   }else{
     return right(articlesResponse.articles ?? []);
   }
  }
}