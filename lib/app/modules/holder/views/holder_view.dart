import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../appAssets/app_colors.dart';
import '../../../common/widgets/appbar_custom.dart';
import '../../../common/widgets/bottom_navigation_custom.dart';
import '../../connect/views/connect_view.dart';
import '../../home/views/home_view.dart';
import '../../liveClass/views/live_class_view.dart';
import '../../notifications/views/notifications_view.dart';
import '../controllers/holder_controller.dart';

class HolderView extends GetView<HolderController> {
  const HolderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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

                Positioned.fill(
                  child: Navigator(
                    key: controller.navigatorKey,
                    initialRoute: '/home',
                    onGenerateRoute: (settings) {
                      Widget page = const HomeView(); // Default page
                      if (settings.name == '/live-class') {
                        page = const LiveClassView();
                      }else if(settings.name == '/connect'){
                        page = const ConnectView();
                      }else if(settings.name == '/notifications'){
                        page = const NotificationsView();
                      }
                      return MaterialPageRoute(builder: (_) => page);
                    },
                  ),
                ),

                // Appbar
                Positioned(
                  left: 0,
                  top: 0,
                  child: AppBarCustom(),
                ),


                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Obx(() {
                    controller.currentPageIndex.value;
                    return BottomNavigationCustom(
                      selectedIndex: controller.currentPageIndex.value,
                      onHomeTap: (){
                        if(controller.currentPageIndex.value != 0){
                          controller.currentPageIndex.value = 0;
                          controller.navigatorKey.currentState!.pushNamed('/home');
                          //Get.to(() => const HomeView());
                        }
                      },
                      onLiveClassTap: (){
                        if(controller.currentPageIndex.value != 1){
                          controller.currentPageIndex.value = 1;
                          controller.navigatorKey.currentState!.pushNamed('/live-class');
                          //Get.to(() => const LiveClassView());
                        }
                      },
                      onConnectTap: (){
                        if(controller.currentPageIndex.value != 2){
                          controller.currentPageIndex.value = 2;
                          controller.navigatorKey.currentState!.pushNamed('/connect');
                          //Get.to(() => const ConnectView());
                        }
                      },
                      onNotificationTap: (){
                        if(controller.currentPageIndex.value != 3){
                          controller.currentPageIndex.value = 3;
                          controller.navigatorKey.currentState!.pushNamed('/notifications');
                          //Get.to(() => const NotificationsView());
                        }
                      },
                    );
                  }),
                ),


              ],
            );
          }
      ),
    );
  }
}
