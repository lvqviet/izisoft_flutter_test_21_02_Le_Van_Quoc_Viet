
import 'package:get/get.dart';
import 'package:izi_app/models/user_model.dart';
import 'package:izi_app/repositories/api_service.dart';


abstract class IUserRepository {
  Future<UserModel?> getUser(String id);
}

class UserRepository implements IUserRepository {
  ApiService get _appService => Get.find();

  String get _path => '/users';

  @override
  Future<UserModel?> getUser(String id) async {
    final res = await _appService.get(
      '$_path/$id',
    );
    if (res.isSuccess) {
      var userJsonData = res.data;
      return UserModel.fromJson(userJsonData);
    }
    return null;
  }

}
