import 'package:dartz/dartz.dart';
import 'package:news_app_hti_online/data/api/api_service.dart';
import 'package:news_app_hti_online/data/api/articles_response/Article.dart';
import 'package:news_app_hti_online/data/data_sources/articles_data_source.dart';

import '../api/sources_response/Source.dart';

class ArticlesApiDataSource implements ArticlesDataSource{
  ApiService apiService;
  ArticlesApiDataSource({required this.apiService});

  @override
  Future<Either<String, List<Article>>> getArticles(Source source) {
   return apiService.getArticles(source);
  }
}