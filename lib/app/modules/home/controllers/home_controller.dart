import 'package:cool_dropdown/controllers/dropdown_controller.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../appAssets/app_icons.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  RxList<Map<String, dynamic>> categoriesList = [
    {"icon": AppIcons.iconCompetitiveExam, "text": "Competitive Exam"},
    {"icon": AppIcons.iconCompetitiveExam, "text": "Kerela psc"},
    {"icon": AppIcons.iconCompetitiveExam, "text": "Banking"},
    {"icon": AppIcons.iconCompetitiveExam, "text": "IT and Softwares"},
    {"icon": AppIcons.iconCompetitiveExam, "text": "Civil"},
    {"icon": AppIcons.iconCompetitiveExam, "text": "Defence"},
    {"icon": AppIcons.iconCompetitiveExam, "text": "Engineering"},
  ].obs;

  RxList<Map<String, dynamic>> coursesList = [
    {
      "thumbnail": "https://images.unsplash.com/photo-1598981457915-aea220950616?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fGV4YW18ZW58MHx8MHx8fDA%3D",
      "showPlay": true,
      "showProgress": true,
      "progress": 0.3,
      "isPremium": true,
      "isLive": true,
      "isRecorded": false,
      "title": "Certificate in word processing and data entry console operation",
      "subtitle": "Talent Academy",
      "rating": 4.5,
      "reviewCount": 432,
    },
    {
      "thumbnail": "",
      "showPlay": true,
      "showProgress": true,
      "progress": 0.5,
      "isPremium": false,
      "isLive": false,
      "isRecorded": true,
      "title": "Bachelor of commerce and bachelor of legislative law",
      "subtitle": "Talent Academy",
      "rating": 2.4,
      "reviewCount": 432,
    },
    {
      "thumbnail": "https://images.unsplash.com/photo-1567097318286-c5c442a58aed?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzl8fGV4YW18ZW58MHx8MHx8fDA%3D",
      "showPlay": true,
      "showProgress": true,
      "progress": 0.8,
      "isPremium": true,
      "isLive": false,
      "isRecorded": false,
      "title": "Degree level preliminary examination course for state",
      "subtitle": "Talent Academy",
      "rating": 4.4,
      "reviewCount": 678,
    },
    {
      "thumbnail": "https://images.unsplash.com/photo-1550592704-6c76defa9985?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDZ8fGV4YW18ZW58MHx8MHx8fDA%3D",
      "showPlay": true,
      "showProgress": true,
      "progress": 0.2,
      "isPremium": false,
      "isLive": true,
      "isRecorded": false,
      "title": "Data Entry Operator (Provisional State Trade Certificate)",
      "subtitle": "Talent Academy",
      "rating": 3.4,
      "reviewCount": 122,
    }
  ].obs;



  RxList<String> carouselList = [
    "",
    "https://plus.unsplash.com/premium_photo-1683535508528-9228dcc8fa4c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZXhhbXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1516534775068-ba3e7458af70?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGV4YW18ZW58MHx8MHx8fDA%3D",
    ""
  ].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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
