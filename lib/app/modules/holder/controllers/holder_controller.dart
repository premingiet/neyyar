// import 'package:cool_dropdown/controllers/dropdown_controller.dart';
// import 'package:cool_dropdown/models/cool_dropdown_item.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class HolderController extends GetxController {
//   //TODO: Implement HolderController
//
//   final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//
//   List<String> fruits = [
//     'Competitive Exams',
//     'Kerela PSC',
//     'Civil',
//     'Defense',
//     'Engineering',
//     'Medical',
//     'Banking',
//     'IT and Software',
//     'UPSC',
//   ];
//
//   List<CoolDropdownItem<String>> fruitDropdownItems = [];
//   final fruitDropdownController = DropdownController();
//
//   Rx<int> currentPageIndex = (0).obs;
//
//
//   final count = 0.obs;
//   @override
//   void onInit() {
//     super.onInit();
//     List<String> fruits = [
//       'Competitive Exams',
//       'Kerela PSC',
//       'Civil',
//       'Defense',
//       'Engineering',
//       'Medical',
//       'Banking',
//       'IT and Software',
//       'UPSC',
//     ];
//
//     List<CoolDropdownItem<String>> fruitDropdownItems = [];
//     final fruitDropdownController = DropdownController();
//
//     Rx<int> currentPageIndex = (0).obs;
//
//     final count = 0.obs;
//     @override
//     void onInit() {
//       super.onInit();
//       currentPageIndex.value = 0;
//       for (var i = 0; i < fruits.length; i++) {
//         fruitDropdownItems.add(CoolDropdownItem<String>(
//             label: fruits[i],
//             // icon: Container(
//             //   margin: EdgeInsets.only(left: 10),
//             //   height: 25,
//             //   width: 25,
//             //   child: SvgPicture.asset(
//             //     'assets/${fruits[i]}.svg',
//             //   ),
//             // ),
//             // selectedIcon: Container(
//             //   margin: EdgeInsets.only(left: 10),
//             //   height: 25,
//             //   width: 25,
//             //   child: SvgPicture.asset(
//             //     'assets/${fruits[i]}.svg',
//             //     color: Color(0xFF6FCC76),
//             //   ),
//             // ),
//             value: fruits[i]));
//       }
//
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//   }
//
//   void increment() => count.value++;
// }


import 'package:cool_dropdown/controllers/dropdown_controller.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:neyyar/app/appAssets/app_icons.dart';

class HolderController extends GetxController {
  //TODO: Implement HolderController

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Rx<String> profileAvatar = "https://img.freepik.com/free-photo/fashion-boy-with-yellow-jacket-blue-pants_71767-96.jpg".obs;

  List<String> exams = [
    'Competitive Exams',
    'Kerela PSC',
    'Civil',
    'Defense',
    'Engineering',
    'Medical',
    'Banking',
    'IT and Software',
    'UPSC',
  ];

  List<CoolDropdownItem<String>> examsDropdownItems = [];
  final examsDropdownController = DropdownController();

  Rx<int> currentPageIndex = (0).obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    currentPageIndex.value = 0;
    for (var i = 0; i < exams.length; i++) {
      examsDropdownItems.add(CoolDropdownItem<String>(
          label: exams[i],
          value: exams[i]));
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
