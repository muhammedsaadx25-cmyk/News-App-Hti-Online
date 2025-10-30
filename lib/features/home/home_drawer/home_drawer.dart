import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_hti_online/core/colors_manager.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.goToHome});
  final void Function() goToHome;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsManager.black,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 166.h,
            width: double.infinity,
            color: ColorsManager.white,
            child: Text(
              "News App",
              style: GoogleFonts.inter(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: ColorsManager.black,
              ),
            ),
          ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             children: [
               SizedBox(height: 16.h,),
               InkWell(
                 onTap: (){
                   goToHome();
                 },
                 child: Row(
                   children: [
                     Icon(Icons.home, color: ColorsManager.white,),
                     SizedBox(width: 8,),
                     Text(
                       "Go To Home",
                       style: GoogleFonts.inter(
                         fontSize: 20.sp,
                         fontWeight: FontWeight.bold,
                         color: ColorsManager.white,
                       ),
                     ),
                   ],
                 ),
               ),
               SizedBox(height: 24.h,),
               Divider(color: ColorsManager.white,height: 1,indent: 20, endIndent: 20,)
               ,SizedBox(height: 24.h,),
               Row(
                 children: [
                   Text(
                     "Dark",
                     style: GoogleFonts.inter(
                       fontSize: 20.sp,
                       fontWeight: FontWeight.bold,
                       color: ColorsManager.white,
                     ),
                   ),
                   Spacer(),
                   Switch(value: true, onChanged: (isDark){

                   })
                 ],
               ),

               SizedBox(height: 24.h,),
               Divider(color: ColorsManager.white,height: 1,indent: 20, endIndent: 20,)
               ,SizedBox(height: 24.h,),
               Row(
                 children: [
                   Text(
                     "English",
                     style: GoogleFonts.inter(
                       fontSize: 20.sp,
                       fontWeight: FontWeight.bold,
                       color: ColorsManager.white,
                     ),
                   ),
                   Spacer(),
                   Switch(value: true, onChanged: (isDark){})
                 ],
               ),
             ],
           ),
         )



        ],
      ),
    );
  }
}
