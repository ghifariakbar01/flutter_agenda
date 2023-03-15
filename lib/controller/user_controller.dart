import 'package:get/get.dart';
import 'package:login/model/user_model.dart';
import 'package:login/repo/app_repo.dart';

class UserController extends GetxController {
  UserController(this._appRepo);

  List<UserModel> users = <UserModel>[].obs;

  final Rx<int> userSelected = 0.obs;

  final AppRepo _appRepo;

  @override
  void onReady() async {
    super.onReady();

    users = (await _appRepo.getUser())!;
  }

  UserModel? searchUser(String email) {
    return users.firstWhere((user) => user.email == email);
  }
}
