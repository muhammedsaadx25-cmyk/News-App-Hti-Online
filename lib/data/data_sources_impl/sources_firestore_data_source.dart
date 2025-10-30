import 'package:dartz/dartz.dart';
import 'package:news_app_hti_online/data/api/sources_response/Source.dart';
import 'package:news_app_hti_online/data/data_sources/sources_data_source.dart';
import 'package:news_app_hti_online/models/category_model.dart';

class SourcesFireStoreDataSource implements SourcesDataSource{
  @override
  Future<Either<String, List<Source>>> getSources(CategoryModel category) {
    // TODO: implement getSources
    throw UnimplementedError();
  }

}