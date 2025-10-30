import 'package:flutter/material.dart';
import 'package:news_app_hti_online/data/api/api_service.dart';
import 'package:news_app_hti_online/data/api/sources_response/Source.dart';
import 'package:news_app_hti_online/models/category_model.dart';
import 'package:news_app_hti_online/repositories/sources_repository.dart';

class SourcesViewModel  extends  ChangeNotifier{
 SourcesRepository sourcesRepository;
 SourcesViewModel({required this.sourcesRepository});
  List<Source> sources = [];
  bool isLoading = false;
  String? erorrMessage ;

  Future<void> fetchSources(CategoryModel category) async {
    isLoading = true;
    notifyListeners();
    var result = await sourcesRepository.getSources(category);
isLoading = false;
notifyListeners();
    result.fold((message){
      erorrMessage = message;
    }, (sourcesList){
      sources = sourcesList;
    });

    notifyListeners();
  }
}
