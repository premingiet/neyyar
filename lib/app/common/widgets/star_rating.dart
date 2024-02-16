import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neyyar/app/appAssets/app_icons.dart';
import 'package:neyyar/app/appAssets/app_textstyles.dart';

class StarRating extends StatelessWidget {
  final double rating; // Rating value between 0.0 and 5.0
  final double starSize;
  final double spacing;
  final int? reviewCount;
  final bool showTextRating;

  const StarRating({
    Key? key,
    required this.rating,
    this.starSize = 12.0,
    this.spacing = 5.0,
    this.reviewCount,
    this.showTextRating = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(rating.toStringAsFixed(1), style: AppTextStyles.msProgress,),
        const SizedBox(width: 10,),
        Stack(
          children: [
            // Unfilled Stars
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(5, (index) => Padding(
                padding: EdgeInsets.only(right: spacing),
                child: SvgPicture.asset(
                  AppIcons.iconStarEmpty,
                  width: starSize,
                  height: starSize,
                  // color: Colors.grey,
                ),
              )),
            ),
            // Filled Stars
            ClipRect(
              child: Align(
                alignment: Alignment.centerLeft,
                widthFactor: rating / 5.0, // Clip proportional to rating
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (index) => Padding(
                    padding: EdgeInsets.only(right: spacing),
                    child: SvgPicture.asset(
                      AppIcons.iconStarEmpty,
                      width: starSize,
                      height: starSize,
                      colorFilter: const ColorFilter.mode(Colors.amber, BlendMode.srcIn),
                      //color: Colors.yellow, // or any color for filled stars
                    ),
                  )),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 5,),
        Text("($reviewCount)", style: AppTextStyles.msReview,),
      ],
    );
  }
}
