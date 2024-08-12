import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/dimensions.dart';

void showCustomSnackBar(String message, {bool isError = true}) {
  Get.showSnackbar(GetSnackBar(
    backgroundColor: isError ? Colors.red : Colors.green,
    message: message,
    duration: const Duration(seconds: 3),
    snackStyle: SnackStyle.FLOATING,
    margin: const EdgeInsets.all(Dimensions.paddingSizeDefaultSmall),
    borderRadius: 10,
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
  ));
}
