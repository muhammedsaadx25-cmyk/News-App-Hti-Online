import 'package:flutter/material.dart';
import 'package:news_app_hti_online/api/api_service.dart';
import 'package:news_app_hti_online/api/sources_response/Source.dart';
import 'package:news_app_hti_online/models/category_model.dart';

class SourcesViewModel  extends  ChangeNotifier{
  /// get list of source
  /// handling business logic
  List<Source> sources = [];
  bool isLoading = false;
  String? erorrMessage ;

  Future<void> fetchSources(CategoryModel category) async {
    isLoading = true;
    notifyListeners();
    var result = await ApiService.getSources(category);
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
