import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neyyar/app/common/widgets/star_rating.dart';
import 'package:shimmer/shimmer.dart';
import '../../appAssets/app_colors.dart';
import '../../appAssets/app_icons.dart';
import '../../appAssets/app_textstyles.dart';
import 'button_custom_shrink.dart';

class NeyyarCoursePanel extends StatelessWidget {
  final String thumbnail;
  final String? videoLink;
  final bool showPlay;
  final bool showProgress;
  final double progress;
  final bool isPremium;
  final bool isLive;
  final bool isRecorded;
  final String title;
  final String subtitle;
  final double rating;
  final int reviewCount;
  final Function(String title, String? videolink) onTap;

  const NeyyarCoursePanel({
    super.key,
    required this.thumbnail,
    this.videoLink,
    required this.showPlay,
    required this.showProgress,
    required this.isPremium,
    required this.isLive,
    required this.isRecorded,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.reviewCount,
    required this.onTap,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonCustomShrink(
      onPressed: (){
        HapticFeedback.heavyImpact();
        onTap(title, videoLink);
      },
      child: SizedBox(
        width: 235,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  Container(
                    width: 235,
                    height: 132,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.colorNeutral100)
                    ),
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
                      placeholder: (context, url) => Center(
                        child: Shimmer.fromColors(
                          baseColor: AppColors.colorNeutral100,
                          highlightColor: AppColors.colorNeutral80,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Center(
                        child: Shimmer.fromColors(
                          baseColor: AppColors.colorNeutral100,
                          highlightColor: AppColors.colorNeutral80,
                          child: const Text(
                            'Neyyar !',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 10,
                    child: Visibility(visible: showPlay ? true : false, child: SvgPicture.asset(AppIcons.iconPlay)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15, width: 235,),
            Visibility(
              visible: showProgress ? true : false,
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: LinearProgressIndicator(
                        backgroundColor: AppColors.colorProgressBack,
                        valueColor: const AlwaysStoppedAnimation<Color>(AppColors.colorProgress,),
                        value: progress,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20, height: 20,),
                  Text("${(progress*10).toInt()}%", style: AppTextStyles.msProgress,)
                ],
              ),
            ),
            Visibility(visible: showProgress ? true : false, child: const SizedBox(height: 8, width: 235,)),
            Wrap(
              runSpacing: 3,
              spacing: 8,
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              children: [
                Visibility(visible: isPremium ? true : false, child: SvgPicture.asset(AppIcons.iconPremium)),
                Visibility(visible: isLive ? true : false, child: SvgPicture.asset(AppIcons.iconLive)),
                Visibility(visible: isRecorded ? true : false, child: SvgPicture.asset(AppIcons.iconRecorded)),
              ],
            ),
            const SizedBox(height: 8, width: 235,),
            Text(title, style: AppTextStyles.msTitle, maxLines: 2, textAlign: TextAlign.start, overflow: TextOverflow.ellipsis,),
            const SizedBox(height: 5, width: 235,),
            Text(subtitle, style: AppTextStyles.msSubTitle, maxLines: 1, textAlign: TextAlign.start, overflow: TextOverflow.ellipsis,),
            const SizedBox(height: 10, width: 235,),
            StarRating(rating: rating, reviewCount: reviewCount,)
          ],
        ),
      ),
    );
  }
}
