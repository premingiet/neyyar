import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neyyar/app/appAssets/app_colors.dart';
import 'package:neyyar/app/appAssets/app_icons.dart';
import 'package:neyyar/app/appAssets/app_textstyles.dart';
import 'package:neyyar/app/common/widgets/appbar_custom.dart';
import 'package:neyyar/app/common/widgets/bottom_navigation_custom.dart';
import 'package:neyyar/app/common/widgets/button_custom_shrink.dart';
import 'package:neyyar/app/common/widgets/faculty_custom_widget.dart';
import 'package:neyyar/app/common/widgets/item_custom_category.dart';
import 'package:neyyar/app/common/widgets/neyyar_course_panel.dart';
import 'package:neyyar/app/common/widgets/star_rating.dart';
import 'package:neyyar/app/common/widgets/wrap_limited.dart';
import 'package:neyyar/app/modules/connect/views/connect_view.dart';
import 'package:neyyar/app/modules/liveClass/views/live_class_view.dart';
import 'package:neyyar/app/modules/notifications/views/notifications_view.dart';
import 'package:shimmer/shimmer.dart';
import '../../../common/widgets/carousel_with_indicator.dart';
import '../../../common/widgets/dropdown_custom_animated.dart';
import '../../../common/widgets/panel_headline_with_click.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, box) {
          return Stack(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints.expand(),
                child: const ColoredBox(
                  color: AppColors.colorNeutralf,
                ),
              ),

              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 30+87,),
                    Container(
                      height: 200,
                      width: box.maxWidth,
                      margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: Obx(() {
                        controller.carouselList.length;
                        return CarouselWithIndicator(
                          isAutoScroll: true,
                          duration: const Duration(milliseconds: 5000),
                          imageUrls: controller.carouselList.map((e) => e.toString()).toList(),
                          // imageUrls: const [
                          //   'https://images.pexels.com/photos/1133957/pexels-photo-1133957.jpeg?auto=compress&cs=tinysrgb&w=600',
                          //   'https://images.pexels.com/photos/462162/pexels-photo-462162.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          //   // Add more image URLs
                          // ],
                          onImageTap: (String url) {
                            if (kDebugMode) {
                              print('Image tapped: $url');
                            }
                            // Handle the tap, such as navigating to a new screen with the image
                          },
                        );
                      }),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SizedBox(
                          height: 40,
                          width: box.maxWidth-40,
                          child: PanelHeadlineWithClick(
                            title: 'Categories',
                            onTap: () {

                            },
                          ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Obx(() {
                        return WrapLimited(
                          maxRows: 2,
                          onTap: (String title) {
                            if (kDebugMode) {
                              print("--- pressed $title ---");
                            }
                          },
                          children: controller.categoriesList.map((e) => ItemCustomCategory(title: e["text"], iconLink: e["icon"],)).toList(),
                        );
                      }),
                    ),

                    const SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SizedBox(
                        height: 40,
                        width: box.maxWidth-40,
                        child: PanelHeadlineWithClick(
                          title: 'My Courses',
                          titleEnd: '',
                          onTap: () {

                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),

                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 300,
                        color: Colors.transparent,
                        child: Obx(() {
                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (c,i){

                              return NeyyarCoursePanel(
                                thumbnail: controller.coursesList[i]["thumbnail"],
                                showPlay: controller.coursesList[i]["showPlay"],
                                showProgress: controller.coursesList[i]["showProgress"],
                                progress: controller.coursesList[i]["progress"],
                                isPremium: controller.coursesList[i]["isPremium"],
                                isLive: controller.coursesList[i]["isLive"],
                                isRecorded: controller.coursesList[i]["isRecorded"],
                                title: controller.coursesList[i]["title"],
                                subtitle: controller.coursesList[i]["subtitle"],
                                rating: controller.coursesList[i]["rating"],
                                reviewCount: controller.coursesList[i]["reviewCount"],
                                onTap: (String title, String? videoLink) {
                                  if (kDebugMode) {
                                    print("--- title -> $title ---");
                                  }
                                },
                              );
                            },
                            separatorBuilder: (c,i){
                              return const SizedBox(width: 20,);
                            },
                            itemCount: controller.coursesList.length,
                          );
                        }),
                      ),
                    ),




                    const SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SizedBox(
                        height: 40,
                        width: box.maxWidth-40,
                        child: PanelHeadlineWithClick(
                          title: 'Top Courses For ',
                          titleEnd: 'Kerala PSC',
                          onTap: () {

                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),

                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 300,
                        color: Colors.transparent,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (c,i){
                            return NeyyarCoursePanel(
                              thumbnail: '',
                              showPlay: true,
                              showProgress: false,
                              progress: 0.5,
                              isPremium: true,
                              isLive: true,
                              isRecorded: false,
                              title: 'Data Entry Operator (Provisional State Trade Certificate)',
                              subtitle: 'Talent Academy',
                              rating: 2.4,
                              reviewCount: 432,
                              onTap: (String title, String? videoLink) {
                                if (kDebugMode) {
                                  print("--- title -> $title ---");
                                }
                              },
                            );
                          },
                          separatorBuilder: (c,i){
                            return const SizedBox(width: 20,);
                          },
                          itemCount: 5,
                        ),
                      ),
                    ),





                    const SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SizedBox(
                        height: 40,
                        width: box.maxWidth-40,
                        child: PanelHeadlineWithClick(
                          title: 'Top Courses For ',
                          titleEnd: 'SSC',
                          onTap: () {

                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),

                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 300,
                        color: Colors.transparent,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (c,i){
                            return NeyyarCoursePanel(
                              thumbnail: '',
                              showPlay: true,
                              showProgress: false,
                              progress: 0.5,
                              isPremium: true,
                              isLive: true,
                              isRecorded: false,
                              title: 'Data Entry Operator (Provisional State Trade Certificate)',
                              subtitle: 'Talent Academy',
                              rating: 2.4,
                              reviewCount: 432,
                              onTap: (String title, String? videoLink) {
                                if (kDebugMode) {
                                  print("--- title -> $title ---");
                                }
                              },
                            );
                          },
                          separatorBuilder: (c,i){
                            return const SizedBox(width: 20,);
                          },
                          itemCount: 5,
                        ),
                      ),
                    ),



                    const SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SizedBox(
                        height: 40,
                        width: box.maxWidth-40,
                        child: PanelHeadlineWithClick(
                          title: 'Top Courses For ',
                          titleEnd: 'CSEB',
                          onTap: () {

                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),

                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 300,
                        color: Colors.transparent,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (c,i){
                            return NeyyarCoursePanel(
                              thumbnail: '',
                              showPlay: true,
                              showProgress: false,
                              progress: 0.5,
                              isPremium: true,
                              isLive: true,
                              isRecorded: false,
                              title: 'Data Entry Operator (Provisional State Trade Certificate)',
                              subtitle: 'Talent Academy',
                              rating: 2.4,
                              reviewCount: 432,
                              onTap: (String title, String? videoLink) {
                                if (kDebugMode) {
                                  print("--- title -> $title ---");
                                }
                              },
                            );
                          },
                          separatorBuilder: (c,i){
                            return const SizedBox(width: 20,);
                          },
                          itemCount: 5,
                        ),
                      ),
                    ),



                    const SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SizedBox(
                        height: 40,
                        width: box.maxWidth-40,
                        child: PanelHeadlineWithClick(
                          title: 'Top Institutes',
                          titleEnd: '',
                          onTap: () {

                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),

                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 300,
                        color: Colors.transparent,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (c,i){
                            return NeyyarCoursePanel(
                              thumbnail: '',
                              showPlay: true,
                              showProgress: false,
                              progress: 0.5,
                              isPremium: true,
                              isLive: true,
                              isRecorded: false,
                              title: 'Indira Gandhi National Open University',
                              subtitle: 'Subscribers : 29.9K  Courses : 104',
                              rating: 2.4,
                              reviewCount: 432,
                              onTap: (String title, String? videoLink) {
                                if (kDebugMode) {
                                  print("--- title -> $title ---");
                                }
                              },
                            );
                          },
                          separatorBuilder: (c,i){
                            return const SizedBox(width: 20,);
                          },
                          itemCount: 5,
                        ),
                      ),
                    ),




                    const SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SizedBox(
                        height: 40,
                        width: box.maxWidth-40,
                        child: PanelHeadlineWithClick(
                          title: 'Top Faculties',
                          titleEnd: '',
                          onTap: () {

                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),

                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 106.92,
                        color: Colors.transparent,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (c,i){
                            return const FacultyCustomWidget(
                                thumbnail: "",
                                title: "Angelle Isabella",
                                subtitle: "3 year of teaching experience",
                                rating: 4.6,
                                review: 124,
                                student: 1024,
                                courses: 10,
                            );
                            // return Container(
                            //   width: 293.5,
                            //   height: 106.92,
                            //   color: Colors.transparent,
                            //   child: Column(
                            //     children: [
                            //       Expanded(
                            //         child: Row(
                            //           children: [
                            //             CircleAvatar(
                            //               radius: 24,
                            //             ),
                            //             SizedBox(width: 20,),
                            //             Expanded(
                            //               child: Column(
                            //                 mainAxisAlignment: MainAxisAlignment.center,
                            //                 crossAxisAlignment: CrossAxisAlignment.start,
                            //                 children: [
                            //                   Text("Angelle Isabella", style: AppTextStyles.msSub12,),
                            //                   Text("3 year of teaching experience", style: AppTextStyles.msReviewLight,),
                            //                 ],
                            //               ),
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //       Container(
                            //         height: 50,
                            //         width: double.maxFinite,
                            //         padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
                            //         decoration: BoxDecoration(
                            //           color: const Color(0xffF5fcff),
                            //           borderRadius: BorderRadius.circular(10),
                            //           border: Border.all(color: const Color(0xffeef3f9))
                            //         ),
                            //         child: Row(
                            //           children: [
                            //             Flexible(
                            //               flex: 1,
                            //               child: SizedBox(
                            //                 width: double.maxFinite,
                            //                 height: double.maxFinite,
                            //                 child: Column(
                            //                   mainAxisAlignment: MainAxisAlignment.center,
                            //                   crossAxisAlignment: CrossAxisAlignment.start,
                            //                   children: [
                            //                     Text("4.6", style: AppTextStyles.msProgress,),
                            //                     Text("Ratings", style: AppTextStyles.msReview,),
                            //                   ],
                            //                 ),
                            //               ),
                            //             ),
                            //
                            //
                            //             Flexible(
                            //               flex: 1,
                            //               child: SizedBox(
                            //                 width: double.maxFinite,
                            //                 height: double.maxFinite,
                            //                 child: Column(
                            //                   mainAxisAlignment: MainAxisAlignment.center,
                            //                   crossAxisAlignment: CrossAxisAlignment.start,
                            //                   children: [
                            //                     Text("124", style: AppTextStyles.msProgress,),
                            //                     Text("Reviews", style: AppTextStyles.msReview,),
                            //                   ],
                            //                 ),
                            //               ),
                            //             ),
                            //
                            //             Flexible(
                            //               flex: 1,
                            //               child: SizedBox(
                            //                 width: double.maxFinite,
                            //                 height: double.maxFinite,
                            //                 child: Column(
                            //                   mainAxisAlignment: MainAxisAlignment.center,
                            //                   crossAxisAlignment: CrossAxisAlignment.start,
                            //                   children: [
                            //                     Text("1024", style: AppTextStyles.msProgress,),
                            //                     Text("Students", style: AppTextStyles.msReview,),
                            //                   ],
                            //                 ),
                            //               ),
                            //             ),
                            //
                            //             Flexible(
                            //               flex: 1,
                            //               child: SizedBox(
                            //                 width: double.maxFinite,
                            //                 height: double.maxFinite,
                            //                 child: Column(
                            //                   mainAxisAlignment: MainAxisAlignment.center,
                            //                   crossAxisAlignment: CrossAxisAlignment.start,
                            //                   children: [
                            //                     Text("10", style: AppTextStyles.msProgress,),
                            //                     Text("Courses", style: AppTextStyles.msReview,),
                            //                   ],
                            //                 ),
                            //               ),
                            //             ),
                            //           ],
                            //         ),
                            //       )
                            //     ],
                            //   ),
                            // );
                          },
                          separatorBuilder: (c,i){
                            return const SizedBox(width: 20,);
                          },
                          itemCount: 5,
                        ),
                      ),
                    ),




                    const SizedBox(height: 100,),
                    // const SizedBox(height: 500,),
                    const SizedBox(height: 50,),
                  ],
                ),
              ),

              // Positioned(
              //   left: 0,
              //   top: 0,
              //   child: AppBarCustom(),
              // ),

              // Appbar
              // Positioned(
              //   left: 0,
              //   top: 0,
              //   child: AppBarCustom(),
              //   // child: PhysicalModel(
              //   //   color: AppColors.colorNeutralf,
              //   //   elevation: 10,
              //   //   shadowColor: AppColors.colorNeutral0.withOpacity(0.2),
              //   //   child: Container(
              //   //     height: 30+87,
              //   //     width: box.maxWidth,
              //   //     color: AppColors.colorNeutralf,
              //   //     padding: const EdgeInsets.fromLTRB(20, 30+15, 20, 10),
              //   //     child: Row(
              //   //       mainAxisAlignment: MainAxisAlignment.start,
              //   //       crossAxisAlignment: CrossAxisAlignment.center,
              //   //       children: [
              //   //         ButtonCustomShrink(
              //   //           onPressed: (){
              //   //             HapticFeedback.heavyImpact();
              //   //           },
              //   //           child: SvgPicture.asset(
              //   //             AppIcons.iconMenu,
              //   //             width: 48,
              //   //             height: 48,
              //   //           ),
              //   //         ),
              //   //         const SizedBox(width: 15,),
              //   //         Expanded(
              //   //           child: CoolDropdown<String>(
              //   //             controller: controller.fruitDropdownController,
              //   //             dropdownList: controller.fruitDropdownItems,
              //   //             defaultItem: null,
              //   //             onChange: (value) async {
              //   //               if (controller.fruitDropdownController.isError) {
              //   //                 await controller.fruitDropdownController.resetError();
              //   //               }
              //   //               // fruitDropdownController.close();
              //   //             },
              //   //             onOpen: (value) {},
              //   //             resultOptions: ResultOptions(
              //   //               padding: const EdgeInsets.symmetric(horizontal: 10),
              //   //               width: 200,
              //   //               icon: const SizedBox(
              //   //                 width: 10,
              //   //                 height: 10,
              //   //                 child: CustomPaint(
              //   //                   painter: DropdownArrowPainter(),
              //   //                 ),
              //   //               ),
              //   //               render: ResultRender.all,
              //   //               placeholder: 'Selected\nCategories',
              //   //               placeholderTextStyle: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff1c1e21)),
              //   //               textStyle: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xff1c1e21)),
              //   //               isMarquee: true,
              //   //             ),
              //   //             dropdownOptions: DropdownOptions(
              //   //                 top: 20,
              //   //                 height: 400,
              //   //                 gap: DropdownGap.all(5),
              //   //                 borderSide: BorderSide(width: 1, color: Colors.black),
              //   //                 padding: EdgeInsets.symmetric(horizontal: 10),
              //   //                 align: DropdownAlign.left,
              //   //                 animationType: DropdownAnimationType.size),
              //   //             // dropdownTriangleOptions: DropdownTriangleOptions(
              //   //             //   width: 20,
              //   //             //   height: 30,
              //   //             //   align: DropdownTriangleAlign.right,
              //   //             //   borderRadius: 3,
              //   //             //   left: 20,
              //   //             // ),
              //   //             dropdownItemOptions: DropdownItemOptions(
              //   //               isMarquee: true,
              //   //               mainAxisAlignment: MainAxisAlignment.start,
              //   //               render: DropdownItemRender.all,
              //   //               height: 50,
              //   //               textStyle: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xff1c1e21)),
              //   //             ),
              //   //           ),
              //   //           // child: DropdownCustomAnimated(
              //   //           //   options: ["apple", "ball"],
              //   //           //   onSelected: (String s){
              //   //           //
              //   //           //   },
              //   //           // ),
              //   //         ),
              //   //         const SizedBox(width: 15,),
              //   //         ButtonCustomShrink(
              //   //           onPressed: (){
              //   //             HapticFeedback.heavyImpact();
              //   //           },
              //   //           child: SvgPicture.asset(
              //   //             AppIcons.iconSearch,
              //   //             width: 44,
              //   //             height: 44,
              //   //           ),
              //   //         ),
              //   //         const SizedBox(width: 15,),
              //   //         ButtonCustomShrink(
              //   //           onPressed: (){
              //   //             HapticFeedback.heavyImpact();
              //   //           },
              //   //           child: CircleAvatar(
              //   //             radius: 22,
              //   //           ),
              //   //         )
              //   //       ],
              //   //     ),
              //   //   ),
              //   // ),
              // ),



              // Positioned(
              //   left: 0,
              //   bottom: 0,
              //   child: Obx(() {
              //     controller.currentPageIndex.value;
              //     return BottomNavigationCustom(
              //       selectedIndex: controller.currentPageIndex.value,
              //       onHomeTap: (){
              //         if(controller.currentPageIndex.value != 0){
              //           controller.currentPageIndex.value = 0;
              //           Get.to(() => const HomeView());
              //         }
              //       },
              //       onLiveClassTap: (){
              //         if(controller.currentPageIndex.value != 1){
              //           controller.currentPageIndex.value = 1;
              //           Get.to(() => const LiveClassView());
              //         }
              //       },
              //       onConnectTap: (){
              //         if(controller.currentPageIndex.value != 2){
              //           controller.currentPageIndex.value = 2;
              //           Get.to(() => const ConnectView());
              //         }
              //       },
              //       onNotificationTap: (){
              //         if(controller.currentPageIndex.value != 3){
              //           controller.currentPageIndex.value = 3;
              //           Get.to(() => const NotificationsView());
              //         }
              //       },
              //     );
              //   }),
              // ),


            ],
          );
        }
      ),
    );
  }
}

