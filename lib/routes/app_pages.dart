
import 'package:get/get.dart';
import 'package:izi_app/modules/main/controller.dart';
import 'package:izi_app/modules/main/home/controller.dart';
import 'package:izi_app/modules/main/page.dart';

import 'app_routes.dart';

abstract class AppPages {
  static final List<GetPage<dynamic>> pages = [
    // GetPage(
    //   name: Routes.campaignDetail,
    //   page: () => const SplashPage(),
    //   bindings: [
    //     BindingsBuilder.put(() => SplashController()),
    //   ],
    // ),
    // GetPage(
    //   name: Routes.profile,
    //   page: () => LoginPage(),
    //   bindings: [
    //     BindingsBuilder.put(() => LoginController()),
    //   ],
    // ),
    GetPage(
      name: Routes.main,
      page: () => const MainPage(),
      bindings: [
        BindingsBuilder.put(() => MainController()),
        BindingsBuilder.put(() => HomeController()),
      ],
    ),
  ];
}
