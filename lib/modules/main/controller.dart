
import 'package:get/get.dart';

enum HomeTabItem { home, search, favorite, profile }

class MainController extends GetxController {
  int oldValueCurrentTabIndex = 0;
  RxInt currentTabIndex = HomeTabItem.home.index.obs;

  void onItemTapped(int index) {
    if (index == currentTabIndex.value) return;

   
    oldValueCurrentTabIndex = currentTabIndex.value;
    currentTabIndex.value = index;
  }
}
