import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/controller/auth_controller.dart';
import 'package:shopzy_grocery_user/controller/user_controller.dart';
import 'package:shopzy_grocery_user/data/model/response/response_model.dart';
import 'package:shopzy_grocery_user/data/model/response/userInfo_model.dart';
import 'package:shopzy_grocery_user/helper/route_helper.dart';
import 'package:shopzy_grocery_user/utils/dimensions.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_appbar.dart';
import 'package:shopzy_grocery_user/view/base/custom_button.dart';
import 'package:shopzy_grocery_user/view/base/custom_gradient.dart';
import 'package:shopzy_grocery_user/view/base/custom_snackbar.dart';
import 'package:shopzy_grocery_user/view/base/custom_textfield.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

 // bool? _isLoggedIn;

  @override
  void initState() {
    super.initState();
    //_isLoggedIn = Get.find<AuthController>().isLoggedIn();
    // if (_isLoggedIn! && Get.find<UserController>().userInfoModel == null) {
    //   Get.find<UserController>().getUserInfo();
    // }
    Get.find<UserController>().initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'my_profile'.tr,
        ),
        body: GetBuilder<UserController>(builder: (userController) {
          if (userController.userInfoModel != null) {
            _nameController.text = userController.userInfoModel?.name ?? '';
              _emailController.text = userController.userInfoModel?.email ?? '';
          }
          return CustomGradient(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Center(
                        child: (userController.pickedFile != null)
                            ? ClipOval(
                              child: Image.file(
                                  File(
                                    userController.pickedFile!.path,
                                  ),
                                  width: 110,
                                  height: 110,
                                  fit: BoxFit.cover,
                                ),
                            )
                            : ClipOval(
                                child: Image.asset(
                                  Images.profilePlaceHolderPng,
                                  height: 110,
                                  width: 110,
                                ),
                              ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {
                            userController.pickImage();
                          },
                          child: Image.asset('assets/images/edit_icon.png'),
                        ),
                      )
                    ],
                  ),
                  CustomTextField(
                      controller: _nameController,
                      title: "   ${'full_name'.tr}",
                      hintText: 'Eric Thomson'),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    controller: _emailController,
                      title: "   ${'email_address'.tr}",
                      hintText: 'eric.thomson@gmail.com'),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "   ${"phone_number".tr}",
                      style: interMedium.copyWith(
                          fontSize: Dimensions.fontSizeSmallOnly,
                          height: 1.4,
                          color: Theme.of(context).disabledColor),
                    ),
                  ),
                  const SizedBox(
                    height: Dimensions.radiusSmall,
                  ),
                  Container(
                    height: 52,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Theme.of(context).hintColor),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '+ 91 ' "85236996320",
                          hintStyle: interMedium.copyWith(
                              color: Theme.of(context).disabledColor,
                              fontSize: Dimensions.paddingSizeSmallExtra)),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  CustomButton(
                    title: "Update".tr,
                    onPressed: () {
                      _updateProfile(userController);
                    },
                    radius: 10,
                  )
                ],
              ),
            ),
          );
        }));
  }

  void _updateProfile(UserController userController) async {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    if (userController.userInfoModel?.name == name &&
        userController.userInfoModel?.email == _emailController.text &&
        userController.pickedFile == null) {
      showCustomSnackBar('change_something_to_update'.tr);
    } else if (name.isEmpty) {
      showCustomSnackBar('enter_your_name'.tr);
    } else if (email.isEmpty) {
      showCustomSnackBar('enter_email_address'.tr);
    } else if (!GetUtils.isEmail(email)) {
      showCustomSnackBar('enter_a_valid_email_address'.tr);
    } else {
      UserInfoModel updatedUser = UserInfoModel(
        name: name,
        email: email,
      );
      ResponseModel responseModel = await userController.updateUserInfo(
          updatedUser, Get.find<AuthController>().getUserToken());
      if (responseModel.isSuccess!) {
        Get.toNamed(RouteHelper.getInitialRoute());
        showCustomSnackBar('profile_updated_successfully'.tr, isError: false);
      } else {
        showCustomSnackBar(responseModel.message!);
      }
    }
  }
}
