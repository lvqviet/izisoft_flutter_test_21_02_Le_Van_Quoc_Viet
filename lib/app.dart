import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:izi_app/repositories/api_service.dart';
import 'package:izi_app/repositories/app_repository.dart';
import 'package:izi_app/routes/app_pages.dart';
import 'package:izi_app/routes/app_routes.dart';
import 'package:izi_app/theme/asset_colors.dart';
import 'package:izi_app/theme/theme_data.dart';

class App extends StatelessWidget {
  const App({super.key});

  ThemeData get _appThemeData {
    return AppThemeData.generateThemeData(
      branchColor: AppColors.branchColor,
      primaryColor: AppColors.primary,
      lightPrimaryColor: AppColors.primaryLight,
      secondaryColor: AppColors.secondary,
      lightSecondaryColor: AppColors.secondaryLight,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = _appThemeData;
    const transition = kIsWeb ? Transition.noTransition : Transition.rightToLeft;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    final initialBinding = BindingsBuilder(() {
      Get.put(ApiService());
      Get.lazyPut<IUserRepository>(() => UserRepository(), fenix: true);
      // Get.put(AppController());
    });
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 500)
      ..errorWidget = const Icon(
        Icons.clear,
        color: Colors.red,
        size: 50,
      )
      ..successWidget = const Icon(
        Icons.done,
        color: Colors.green,
        size: 50,
      )
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..backgroundColor = Colors.white
      ..indicatorColor = AppColors.primary
      ..textColor = Colors.white
      ..maskType = EasyLoadingMaskType.black
      ..userInteractions = false
      ..dismissOnTap = false;
    initializeDateFormatting();
    return GetMaterialApp(
      title: 'IZI App',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      theme: theme,
      darkTheme: theme,
      builder: EasyLoading.init(builder: _builder),
      initialBinding: initialBinding,
      defaultTransition: transition,
      initialRoute: Routes.main,

    );
  }

  Widget _builder(BuildContext context, Widget? child) {
    double textScale = 1.0;
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(platformBrightness: Brightness.light, textScaler: TextScaler.linear(textScale)),
      child: child ?? const SizedBox(),
    );
  }
}
