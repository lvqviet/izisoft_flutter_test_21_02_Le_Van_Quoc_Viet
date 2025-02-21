import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:izi_app/models/user_model.dart';
import 'package:izi_app/repositories/app_repository.dart';

class HomeController extends GetxController {
  IUserRepository get _userRepo => Get.find();

  final user = Rx<UserModel?>(null);
  final categorySelected = 'Education'.obs;

  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  Future<void> getUser() async {
    EasyLoading.show();
    final res = await _userRepo.getUser('1');
    EasyLoading.dismiss();
    if (res != null) {
      user.value = res;
    }
  }
}
