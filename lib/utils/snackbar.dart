// make error snackbar
import 'package:get/get.dart';
import 'package:login/constant.dart';

void makeErrorSb(String title, String message) {
  Get.snackbar(title, message,
      backgroundColor: kRed, snackPosition: SnackPosition.BOTTOM);
}

void makeSuccessSb(String title, String message) {
  Get.snackbar(title, message,
      backgroundColor: kGreen, snackPosition: SnackPosition.BOTTOM);
}
