import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_hti_online/api/api_service.dart';
import 'package:news_app_hti_online/api/articles_response/Article.dart'
    show Article;
import 'package:news_app_hti_online/api/sources_response/Source.dart';
import 'package:news_app_hti_online/core/colors_manager.dart';
import 'package:news_app_hti_online/features/home/sources_view/article_item.dart';
import 'package:news_app_hti_online/features/home/sources_view/articles_viewModel.dart';
import 'package:news_app_hti_online/features/home/sources_view/sources_view_model.dart';
import 'package:news_app_hti_online/models/category_model.dart'
    show CategoryModel;
import 'package:provider/provider.dart';

class SourcesView extends StatefulWidget {
  SourcesView({super.key, required this.category});

  final CategoryModel category;

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  late SourcesViewModel sourcesViewModel;
  late ArticlesViewModel articlesViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();

  }
  void fetchData()async{
    sourcesViewModel = SourcesViewModel();
    articlesViewModel = ArticlesViewModel();
    await sourcesViewModel.fetchSources(widget.category);
    articlesViewModel.fetchArticles(sourcesViewModel.sources[0]);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: sourcesViewModel),
        ChangeNotifierProvider.value(value: articlesViewModel),
      ],
      child: Column(
        children: [
          Consumer<SourcesViewModel>(
            builder: (context, sourcesViewModel, child) {
              if (sourcesViewModel.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (sourcesViewModel.erorrMessage != null) {
                return Center(
                  child: Text(
                    sourcesViewModel.erorrMessage!,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }

              List<Source> sources = sourcesViewModel.sources ?? [];
              return DefaultTabController(
                length: sources.length,
                child: TabBar(
                  onTap: (index){
                    articlesViewModel.fetchArticles(sourcesViewModel.sources[index]);
                  },
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  dividerColor: Colors.transparent,
                  indicatorColor: ColorsManager.white,
                  labelStyle: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.white,
                  ),
                  unselectedLabelStyle: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.white,
                  ),
                  tabs: sources
                      .map((source) => Tab(text: source.name))
                      .toList(),
                ),
              );
            },
          ),

          Consumer<ArticlesViewModel>(
            builder: (context, articlesViewModel, child) {
              if (articlesViewModel.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (articlesViewModel.errorMessage != null) {
                return Center(
                  child: Text(
                    articlesViewModel.errorMessage!,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
              List<Article> articles = articlesViewModel.articles;
              return Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      ArticleITem(article: articles[index]),
                  separatorBuilder: (context, index) => SizedBox(height: 16.h),
                  itemCount: articles.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
