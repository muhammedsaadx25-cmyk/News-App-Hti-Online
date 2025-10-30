import 'package:dartz/dartz.dart';
import 'package:news_app_hti_online/data/api/sources_response/Source.dart';
import 'package:news_app_hti_online/models/category_model.dart';

abstract class SourcesDataSource{
  Future<Either<String, List<Source>>> getSources(CategoryModel category);
}