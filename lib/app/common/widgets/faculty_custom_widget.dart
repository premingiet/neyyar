import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../appAssets/app_colors.dart';
import '../../appAssets/app_icons.dart';
import '../../appAssets/app_textstyles.dart';

class FacultyCustomWidget extends StatelessWidget {
  final String thumbnail;
  final String title;
  final String subtitle;
  final double rating;
  final int review;
  final int student;
  final int courses;
  const FacultyCustomWidget({super.key, required this.thumbnail, required this.title, required this.subtitle, required this.rating, required this.review, required this.student, required this.courses});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 293.5,
      height: 106.92,
      color: Colors.transparent,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColors.colorNeutral100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: CachedNetworkImage(
                      imageUrl: thumbnail,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(color: AppColors.colorNeutral100,),
                      ),
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(Icons.error, color: AppColors.colorNeutral50,),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: AppTextStyles.msSub12,),
                      Text(subtitle, style: AppTextStyles.msReviewLight,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            width: double.maxFinite,
            padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
            decoration: BoxDecoration(
                color: const Color(0xffF5fcff),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xffeef3f9))
            ),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(rating.toStringAsFixed(1), style: AppTextStyles.msProgress,),
                        Text("Ratings", style: AppTextStyles.msReview,),
                      ],
                    ),
                  ),
                ),


                Flexible(
                  flex: 1,
                  child: SizedBox(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("$review", style: AppTextStyles.msProgress,),
                        Text("Reviews", style: AppTextStyles.msReview,),
                      ],
                    ),
                  ),
                ),

                Flexible(
                  flex: 1,
                  child: SizedBox(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("$student", style: AppTextStyles.msProgress,),
                        Text("Students", style: AppTextStyles.msReview,),
                      ],
                    ),
                  ),
                ),

                Flexible(
                  flex: 1,
                  child: SizedBox(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("$courses", style: AppTextStyles.msProgress,),
                        Text("Courses", style: AppTextStyles.msReview,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
