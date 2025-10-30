import 'package:dartz/dartz.dart';
import 'package:news_app_hti_online/data/api/api_service.dart';
import 'package:news_app_hti_online/data/api/sources_response/Source.dart';
import 'package:news_app_hti_online/data/data_sources/sources_data_source.dart';
import 'package:news_app_hti_online/data/data_sources_impl/sources_api_data_Source.dart';
import 'package:news_app_hti_online/models/category_model.dart';
import 'package:news_app_hti_online/repositories/sources_repository.dart';

class SourcesRepositoryImpl implements SourcesRepository{
   SourcesDataSource sourcesDataSource;

  SourcesRepositoryImpl({required this.sourcesDataSource});
  @override
  Future<Either<String, List<Source>>> getSources(CategoryModel category) {
   return sourcesDataSource.getSources(category);
  }
  
}