import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/controller/address_controller.dart';
import 'package:shopzy_grocery_user/helper/route_helper.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_appbar.dart';
import 'package:shopzy_grocery_user/view/base/custom_button.dart';
import 'package:shopzy_grocery_user/view/base/custom_gradient.dart';
import 'package:shopzy_grocery_user/view/base/custom_loader.dart';
import 'package:shopzy_grocery_user/view/base/custom_snackbar.dart';
import 'package:shopzy_grocery_user/view/screens/address/add_new_address.dart';
import 'package:shopzy_grocery_user/view/screens/address/widgets/address_widget.dart';
class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<AddressController>().showAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'my_address'.tr,
      ),
      body: GetBuilder<AddressController>(
        builder: (addressController) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                if (addressController.data != null)
                  if (addressController.data!.isNotEmpty)
                    Expanded(
                      child: RefreshIndicator(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                "saved_address".tr,
                                style: interMedium.copyWith(
                                  color: Theme.of(context).disabledColor,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: AlwaysScrollableScrollPhysics(),
                                itemCount: addressController.data!.length,
                                itemBuilder: (context, index) {
                                  return AddressWidget(
                                    title: addressController
                                        .data![index].addressType!,
                                    subtitle: addressController
                                        .data![index].address!,
                                    onpress: ()=>deleteAddress(addressController, index) ,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        onRefresh: () async {
                          addressController.showAddress();
                        },
                      ),
                    )
                  else
                    Text("no_saved_address".tr)
                else
                  CustomLoader(),
                CustomButton(
                  title: "add_new_address".tr,
                  onPressed: () {
                    Get.toNamed(RouteHelper.getAddAddressRoute());
                  },
                  radius: 10,
                  fontSize: 16,
                )
              ],
            ),
          );
        },
      ),
    );
  }
  Future<void> deleteAddress(AddressController addressController, int index) async {
    final response = await addressController.removeAddress(
        addressController.data![index].id!, index);

    Get.back();
    showCustomSnackBar("${response.message}");
  }

}
