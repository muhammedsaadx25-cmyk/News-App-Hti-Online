import 'package:dartz/dartz.dart';
import 'package:news_app_hti_online/data/api/articles_response/Article.dart';
import 'package:news_app_hti_online/data/api/sources_response/Source.dart';
import 'package:news_app_hti_online/data/data_sources/articles_data_source.dart';
import 'package:news_app_hti_online/repositories/articles_repository.dart';

class ArticlesRepositoryImpl implements ArticlesRepository{
  ArticlesDataSource articlesDataSource;
  ArticlesRepositoryImpl({required this.articlesDataSource});
  @override
  Future<Either<String, List<Article>>> getArticles(Source source) {
   return articlesDataSource.getArticles(source);
  }

}