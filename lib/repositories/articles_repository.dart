import 'package:dartz/dartz.dart';
import 'package:news_app_hti_online/data/api/articles_response/Article.dart';
import 'package:news_app_hti_online/data/api/sources_response/Source.dart';

abstract class ArticlesRepository{
  Future<Either<String, List<Article>>> getArticles(Source source);
}