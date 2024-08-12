import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/controller/address_controller.dart';
import 'package:shopzy_grocery_user/data/model/body/add_address_body.dart';
import 'package:shopzy_grocery_user/helper/route_helper.dart';
import 'package:shopzy_grocery_user/utils/dimensions.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_appbar.dart';
import 'package:shopzy_grocery_user/view/base/custom_button.dart';
import 'package:shopzy_grocery_user/view/base/custom_gradient.dart';
import 'package:shopzy_grocery_user/view/base/custom_snackbar.dart';
import 'package:shopzy_grocery_user/view/base/custom_textfield.dart';
import 'package:shopzy_grocery_user/view/screens/address/address.dart';

class AddNewAddressScreen extends StatefulWidget {
  const AddNewAddressScreen({super.key});

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  FocusNode fieldOne= FocusNode();
  FocusNode fieldTwo= FocusNode();
  FocusNode fieldThree= FocusNode();
  FocusNode fieldFour= FocusNode();
  FocusNode fieldFive= FocusNode();
  FocusNode fieldSix= FocusNode();
  FocusNode fielSeven= FocusNode();
  final TextEditingController _addresTypeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _houseNumberController = TextEditingController();
  final TextEditingController _flatNumberController = TextEditingController();
  final TextEditingController _streetAddController = TextEditingController();
  final TextEditingController _landMarkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'my_new_address'.tr,
      ),
      body: GetBuilder<AddressController>(builder: (addressController){
        return CustomGradient(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset(Images.mapPng),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Center(
                    child: Text(
                      'location_correctly'.tr,
                      style: interSemiBold.copyWith(
                          color: Theme.of(context).hintColor, fontSize: 14),
                    ),
                  ),
                ),
                CustomTextField(
                  title: ''.tr,
                  hintText:
                  'Q9G7 + H4F, Mirpur road , Dhaka, Bangladesh - dubai'.tr,
                  required: false,
                  color: true,
                ),
                CustomTextField(
                  controller: _addresTypeController,
                    title: 'address_type'.tr,
                    hintText: 'enter_address_type'.tr,
                    required: true,
                    color: true),
                CustomTextField(
                    controller: _nameController,
                    title: 'person_name'.tr,
                    hintText: 'enter_contact_person'.tr,
                    required: true,
                    color: true),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,

                      child: Text(

                        "    ${"personal_number".tr}",
                        style: interMedium.copyWith(
                            fontSize: Dimensions.fontSizeSmallOnly,
                            height: 1.4,
                            color: Theme.of(context).disabledColor),
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Icon(
                      Icons.star_rounded,
                      color: Colors.red,
                      size: Dimensions.fontSizeVerySmall,
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
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
                    controller: _numberController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '+ 91 ' "85236996320",
                        hintStyle: interMedium.copyWith(
                            color: Theme.of(context).disabledColor,
                            fontSize: Dimensions.paddingSizeSmallExtra)),
                  ),
                ),
                CustomTextField(
                    controller: _emailController,
                    title: 'email_address_personal'.tr,
                    hintText: 'enter_personal_email'.tr,
                    required: true,
                    color: true),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                          title: 'house'.tr,
                          controller: _houseNumberController,
                          hintText: 'enter_house_number'.tr,
                          required: true,
                          color: true),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: CustomTextField(
                          title: 'flat'.tr,
                          controller: _flatNumberController,
                          hintText: 'enter_flat_number'.tr,
                          required: true,
                          color: true),
                    ),
                  ],
                ),
                CustomTextField(
                    title: 'street_address'.tr,
                    controller: _streetAddController,
                    hintText: 'enter_street_address'.tr,
                    required: true,
                    color: true),
                CustomTextField(
                    title: 'nearby_landmark'.tr,
                    controller: _landMarkController,
                    hintText: 'enter_landmark_address'.tr,
                    required: true,
                    color: true),
                SizedBox(
                  height: 50,
                ),
                CustomButton(
                  title: "save_address".tr,
                  onPressed: () {
                    _register(addressController);
                  },
                  radius: 10,
                )
              ],
            ),
          ),
        );
      },),
    );
  }
  void _register(AddressController addressController, ) async {
    String addesType = _addresTypeController.text.trim();
    String email = _emailController.text.trim();
    String houseNumber = _houseNumberController.text.trim();
    String number = _numberController.text.trim();
    String flatNumber = _flatNumberController.text.trim();
    String street = _streetAddController.text.trim();
    String landMark = _landMarkController.text.trim();
    String name = _nameController.text.trim();
    if (addesType.isEmpty) {
      showCustomSnackBar('enter_your_first_name'.tr);
    } else if (name.isEmpty) {
      showCustomSnackBar('enter_your_last_name'.tr);
    } else if (number.isEmpty) {
      showCustomSnackBar('enter_email_address'.tr);
    }  else {
      AddAddressBody addAddressBody = AddAddressBody(
          address_type :addesType,
      contact_person_number :number,
      contact_person_name :name,
      latitude :"",
      longitude:"",
      person_email_address :email,
      house_no :houseNumber,
      flat_no:flatNumber,
      street_address :street,
      nearby_landmark :landMark
      );
      addressController.addAdress(addAddressBody).then((status) async {
        if (status.isSuccess!) {
          Get.toNamed(RouteHelper.getShowAddressRoute());
          //     Get.toNamed(RouteHelper.getAccessLocationRoute(RouteHelper.signUp));
        } else {
          showCustomSnackBar(status.message!);
        }
      });
    }
  }
}
