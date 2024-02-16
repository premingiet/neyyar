import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../appAssets/app_colors.dart';
import '../../appAssets/app_icons.dart';
import '../../appAssets/app_textstyles.dart';
import 'button_custom_shrink.dart';

class ItemCustomCategory extends StatelessWidget {
  final String title;
  final String iconLink;
  final bool isSvg;
  final bool isRemote;

  const ItemCustomCategory({super.key, required this.title, required this.iconLink, this.isSvg = true, this.isRemote = false, });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
      margin: const EdgeInsets.fromLTRB(0, 0, 5, 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(250),),
        border: Border.all(color: AppColors.colorNeutral100),

      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          (isSvg)
              ?
          (isRemote) ? SvgPicture.network(
              iconLink
          ) : SvgPicture.asset(
              iconLink
          )
              :
          CachedNetworkImage(
            imageUrl: iconLink,
            placeholder: (c, s){
              return const Center(child: CircularProgressIndicator(color: AppColors.colorNeutral100,),);
            },
            errorWidget: (c, s, o){
              return SvgPicture.asset(
                  AppIcons.iconEye
              );
            },
          ),
          const SizedBox(width: 10,),
          Text(title, style: AppTextStyles.msCategoriesItems,),
        ],
      ),
    );
  }
}
