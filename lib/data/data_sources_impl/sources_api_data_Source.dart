import 'package:dartz/dartz.dart';
import 'package:news_app_hti_online/data/api/api_service.dart';
import 'package:news_app_hti_online/data/api/sources_response/Source.dart';
import 'package:news_app_hti_online/data/data_sources/sources_data_source.dart';
import 'package:news_app_hti_online/models/category_model.dart';

class SourcesApiDataSource implements SourcesDataSource{
  ApiService apiService;
  /// dependency injection
  SourcesApiDataSource({required this.apiService});
  @override
  Future<Either<String, List<Source>>> getSources(CategoryModel category) {
    return apiService.getSources(category);
  }

}