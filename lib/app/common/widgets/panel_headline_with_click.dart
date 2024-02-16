import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neyyar/app/appAssets/app_colors.dart';
import 'package:neyyar/app/appAssets/app_textstyles.dart';
import 'package:neyyar/app/common/widgets/button_custom_shrink.dart';

import '../../appAssets/app_icons.dart';

class PanelHeadlineWithClick extends StatelessWidget {
  final String title;
  final String titleEnd;
  final VoidCallback onTap;
  const PanelHeadlineWithClick({super.key, required this.title, required this.onTap, this.titleEnd = ""});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppIcons.iconHeadlineLeftBar,
          height: 50,
        ),
        const SizedBox(width: 20,),
        Expanded(
          child: Text.rich(
            //title,
            style: AppTextStyles.msHeadlines,
            TextSpan(
              children: [
                TextSpan(
                  text: title,
                  style: AppTextStyles.msHeadlines,
                ),
                TextSpan(
                  text: " $titleEnd",
                  style: AppTextStyles.msHeadlinesEnd,
                ),
              ],
            )
          ),
        ),
        const SizedBox(width: 20,),
        ButtonCustomShrink(
          onPressed: (){
            HapticFeedback.heavyImpact();
            onTap();
          },
          child: SvgPicture.asset(
            AppIcons.iconHeadlineForwardArrow,
            height: 50,
            width: 50,
          ),
        ),
      ],
    );
  }
}
