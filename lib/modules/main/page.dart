import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izi_app/modules/main/controller.dart';
import 'package:izi_app/modules/main/home/page.dart';
import 'package:izi_app/modules/profile/page.dart';
import 'package:izi_app/theme/asset_colors.dart';

extension MainTabExtension on HomeTabItem {
  Widget get page {
    switch (this) {
      case HomeTabItem.home:
        return HomePage();
      case HomeTabItem.search:
        return Container();
      case HomeTabItem.favorite:
        return Container();
      case HomeTabItem.profile:
        return ProfilePage();
      default:
        return HomePage();
    }
  }



  IconData get icon {
    switch (this) {
      case HomeTabItem.home:
        return Icons.home_outlined;
      case HomeTabItem.search:
        return Icons.search;
      case HomeTabItem.favorite:
        return Icons.favorite_border;
      case HomeTabItem.profile:
        return Icons.person_2_outlined;
      default:
        return Icons.home_outlined;
    }
  }
}

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned.fill(child: getCurrentWidget()),
            Positioned(bottom: 0, left: 0, right: 0, child: customBottomNav())
          ],
        ),
      ),
    );
  }

  Widget customBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xEFF9F9F9),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.3),
            blurRadius: 0,
            offset: const Offset(0, -0.50),
            spreadRadius: 0,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
        child: BottomNavigationBar(
            currentIndex: controller.currentTabIndex.value,
            onTap: controller.onItemTapped,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.primary,
            items: HomeTabItem.values.map(
              (e) {
                final isSelected = controller.currentTabIndex.value == e.index;

                return BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Icon(
                        e.icon,
                        size: 24,
                        color: isSelected ? AppColors.primary : null,
                      ).paddingOnly(bottom: 2, top: 4),
                    ],
                  ),
                  label: '',
                );
              },
            ).toList()),
      ),
    );
  }

  Widget getCurrentWidget() {
    return PageTransitionSwitcher(
      transitionBuilder: (
        Widget child,
        Animation<double> primaryAnimation,
        Animation<double> secondaryAnimation,
      ) {
        return SharedAxisTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
          child: child,
        );
      },
      reverse: controller.oldValueCurrentTabIndex > controller.currentTabIndex.value,
      child: HomeTabItem.values[controller.currentTabIndex.value].page,
    );
  }
}
