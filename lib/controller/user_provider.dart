import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login/login_page.dart';
import 'package:login/model/user_model.dart';
import 'package:login/repo/app_repo.dart';

final userStateNotifierProvider =
    StateNotifierProvider<UserNotifier, UserModel>((ref) {
  return UserNotifier();
});

class UserNotifier extends StateNotifier<UserModel> {
  UserNotifier() : super(UserModel());

  void setUser(UserModel user) {
    print('user beofre ${state.toJson()}}');
    state = user;
    print('user after ${state.toJson()}}');
  }

  void clearUser() {
    state = UserModel();
  }

  Future<UserModel?> setUserByEmail(String email) async {
    final _appRepo = AppRepo();

    final users = await _appRepo.getUser();

    print('users is $users');

    final user = users?.firstWhere((user) => user.email == email);

    print('user is ${user?.toJson()}');

    state = user ?? UserModel();

    return user;
  }
}

final selectedInt = StateProvider<int>((ref) => 0);
