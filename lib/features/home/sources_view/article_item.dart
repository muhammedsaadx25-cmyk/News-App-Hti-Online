import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_hti_online/core/colors_manager.dart';
import 'package:news_app_hti_online/data/api/articles_response/Article.dart';

class ArticleITem extends StatelessWidget {
  const ArticleITem({super.key, required this.article});
final Article article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(width: 1, color: ColorsManager.white)
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? '',
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),),
          ),
          SizedBox(height: 10.h,),
          Text(article.title ?? '', style: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.bold, color: ColorsManager.white),),
          SizedBox(height: 10.h,),
          Row(
            children: [
              Expanded(child: Text(article.author ?? '', style: GoogleFonts.inter(fontSize: 12.sp, fontWeight: FontWeight.w500, color: ColorsManager.grey),)),


              Expanded(child: Text(article.publishedAt ?? '', style: GoogleFonts.inter(fontSize: 12.sp, fontWeight: FontWeight.w500, color: ColorsManager.grey),)),


            ],
          )
        ],
      ),
    );
  }
}
