import 'package:get/get.dart';
import '../modules/connect/bindings/connect_binding.dart';
import '../modules/connect/views/connect_view.dart';
import '../modules/holder/bindings/holder_binding.dart';
import '../modules/holder/views/holder_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/liveClass/bindings/live_class_binding.dart';
import '../modules/liveClass/views/live_class_view.dart';
import '../modules/notifications/bindings/notifications_binding.dart';
import '../modules/notifications/views/notifications_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOLDER;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LIVE_CLASS,
      page: () => const LiveClassView(),
      binding: LiveClassBinding(),
    ),
    GetPage(
      name: _Paths.CONNECT,
      page: () => const ConnectView(),
      binding: ConnectBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.HOLDER,
      page: () => const HolderView(),
      binding: HolderBinding(),
    ),
  ];
}
