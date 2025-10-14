import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_hti_online/core/colors_manager.dart';
import 'package:news_app_hti_online/features/home/categories_view/category_item.dart';
import 'package:news_app_hti_online/models/category_model.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.onCategoryItemClicked});
  final void Function(CategoryModel) onCategoryItemClicked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Good Morning\nHere is Some News For You", style: GoogleFonts.inter(fontSize: 24, color: ColorsManager.white, fontWeight: FontWeight.w500),),
          Expanded(child: ListView.separated(itemBuilder: (_, index)=>SizedBox(height: 16.h,) ,
              separatorBuilder: (_, index)=> InkWell(
                  onTap: (){
onCategoryItemClicked(CategoryModel.categories[index]);
                  },
                  child: CategoryItem(category: CategoryModel.categories[index])), itemCount: 7))
        ],
      ),
    );
  }
}
