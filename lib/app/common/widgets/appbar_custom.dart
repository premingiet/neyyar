import 'package:cached_network_image/cached_network_image.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/customPaints/arrow_down_painter.dart';
import 'package:cool_dropdown/enums/dropdown_align.dart';
import 'package:cool_dropdown/enums/dropdown_animation.dart';
import 'package:cool_dropdown/enums/dropdown_item_render.dart';
import 'package:cool_dropdown/enums/result_render.dart';
import 'package:cool_dropdown/options/dropdown_item_options.dart';
import 'package:cool_dropdown/options/dropdown_options.dart';
import 'package:cool_dropdown/options/result_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neyyar/app/modules/holder/controllers/holder_controller.dart';
import '../../appAssets/app_colors.dart';
import '../../appAssets/app_icons.dart';
import 'button_custom_shrink.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final HolderController controller = Get.put(HolderController());
    return PhysicalModel(
      color: AppColors.colorNeutralf,
      elevation: 10,
      shadowColor: AppColors.colorNeutral0.withOpacity(0.2),
      child: Container(
        height: 30+87,
        width: MediaQuery.of(context).size.width,
        color: AppColors.colorNeutralf,
        padding: const EdgeInsets.fromLTRB(20, 30+15, 20, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ButtonCustomShrink(
              onPressed: (){
                HapticFeedback.heavyImpact();
              },
              child: SvgPicture.asset(
                AppIcons.iconMenu,
                width: 48,
                height: 48,
              ),
            ),
            const SizedBox(width: 15,),
            Expanded(
              child: CoolDropdown<String>(
                controller: controller.examsDropdownController,
                dropdownList: controller.examsDropdownItems,
                defaultItem: null,
                onChange: (value) async {
                  if (controller.examsDropdownController.isError) {
                    await controller.examsDropdownController.resetError();
                  }
                  // fruitDropdownController.close();
                },
                onOpen: (value) {},
                resultOptions: ResultOptions(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: 200,
                  icon: const SizedBox(
                    width: 10,
                    height: 10,
                    child: CustomPaint(
                      painter: DropdownArrowPainter(),
                    ),
                  ),
                  render: ResultRender.all,
                  placeholder: 'Selected\nCategories',
                  placeholderTextStyle: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff1c1e21)),
                  textStyle: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xff1c1e21)),
                  isMarquee: true,
                ),
                dropdownOptions: const DropdownOptions(
                    top: 20,
                    height: 400,
                    gap: DropdownGap.all(5),
                    borderSide: BorderSide(width: 1, color: Colors.black),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    align: DropdownAlign.left,
                    animationType: DropdownAnimationType.size),
                // dropdownTriangleOptions: DropdownTriangleOptions(
                //   width: 20,
                //   height: 30,
                //   align: DropdownTriangleAlign.right,
                //   borderRadius: 3,
                //   left: 20,
                // ),
                dropdownItemOptions: DropdownItemOptions(
                  isMarquee: true,
                  mainAxisAlignment: MainAxisAlignment.start,
                  render: DropdownItemRender.all,
                  height: 50,
                  textStyle: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xff1c1e21)),
                ),
              ),
            ),
            const SizedBox(width: 15,),
            ButtonCustomShrink(
              onPressed: (){
                HapticFeedback.heavyImpact();
              },
              child: SvgPicture.asset(
                AppIcons.iconSearch,
                width: 44,
                height: 44,
              ),
            ),
            const SizedBox(width: 15,),
            ButtonCustomShrink(
              onPressed: (){
                HapticFeedback.heavyImpact();
              },
              child: CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.colorNeutral100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: CachedNetworkImage(
                    imageUrl: controller.profileAvatar.value,
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
            )
          ],
        ),
      ),
    );
  }
}
