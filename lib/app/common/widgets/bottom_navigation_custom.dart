import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../appAssets/app_colors.dart';
import '../../appAssets/app_icons.dart';
import '../../appAssets/app_textstyles.dart';
import 'button_custom_shrink.dart';

class BottomNavigationCustom extends StatelessWidget {
  final int selectedIndex;
  final VoidCallback onHomeTap;
  final VoidCallback onLiveClassTap;
  final VoidCallback onConnectTap;
  final VoidCallback onNotificationTap;
  const BottomNavigationCustom({super.key, required this.selectedIndex, required this.onHomeTap, required this.onLiveClassTap, required this.onConnectTap, required this.onNotificationTap});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: AppColors.colorNeutralf,
      elevation: 30,
      shadowColor: AppColors.colorNeutral0.withOpacity(1),
      child: Container(
        height: 50+72,
        width: MediaQuery.of(context).size.width,
        color: AppColors.colorNeutralf,
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: ButtonCustomShrink(
                onPressed: (){
                  HapticFeedback.heavyImpact();
                  onHomeTap();
                },
                child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  color: Colors.white,
                  child: FittedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppIcons.iconMenuHome, colorFilter: ColorFilter.mode(selectedIndex == 0 ? AppColors.colorMenuSelected : AppColors.colorMenuUnSelected, BlendMode.srcIn),),
                        const SizedBox(height: 10, width: 30,),
                        Text("Home", style: (selectedIndex == 0) ? AppTextStyles.msMenuSelected : AppTextStyles.msMenuUnSelected,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: ButtonCustomShrink(
                onPressed: (){
                  HapticFeedback.heavyImpact();
                  onLiveClassTap();
                },
                child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  color: Colors.white,
                  child: FittedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppIcons.iconMenuLiveClass, colorFilter: ColorFilter.mode(selectedIndex == 1 ? AppColors.colorMenuSelected : AppColors.colorMenuUnSelected, BlendMode.srcIn),),
                        const SizedBox(height: 10, width: 30,),
                        Text("Live Class", style: (selectedIndex == 1) ? AppTextStyles.msMenuSelected : AppTextStyles.msMenuUnSelected,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: ButtonCustomShrink(
                onPressed: (){
                  HapticFeedback.heavyImpact();
                  onConnectTap();
                },
                child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  color: Colors.white,
                  child: FittedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppIcons.iconMenuConnect, colorFilter: ColorFilter.mode(selectedIndex == 2 ? AppColors.colorMenuSelected : AppColors.colorMenuUnSelected, BlendMode.srcIn),),
                        const SizedBox(height: 10, width: 30,),
                        Text("Connect", style: (selectedIndex == 2) ? AppTextStyles.msMenuSelected : AppTextStyles.msMenuUnSelected,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: ButtonCustomShrink(
                onPressed: (){
                  HapticFeedback.heavyImpact();
                  onNotificationTap();
                },
                child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  color: Colors.white,
                  child: FittedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppIcons.iconMenuNotifications, colorFilter: ColorFilter.mode(selectedIndex == 3 ? AppColors.colorMenuSelected : AppColors.colorMenuUnSelected, BlendMode.srcIn),),
                        const SizedBox(height: 10, width: 30,),
                        Text("Notifications", style: (selectedIndex == 3) ? AppTextStyles.msMenuSelected : AppTextStyles.msMenuUnSelected,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
