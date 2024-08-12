import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/dimensions.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/screens/auth/login_screen.dart';
import 'package:shopzy_grocery_user/view/screens/onBoarding/widget/on_boarding_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              SizedBox(
               //    height: Get.height * 0.6885,
                height: Get.height * 0.7059,
                child: PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      onLastPage = (index == 2);
                    });
                  },
                  children: [
                    OnBoardingWidget(
                      image: Images.onBoardFirstPng,
                      title: 'onboard_title1'.tr,
                      subtitle: 'onboard_desc1'.tr,
                    ),
                    OnBoardingWidget(
                      image: Images.onBoardSecondPng,
                      title: 'onboard_title2'.tr,
                      subtitle: 'onboard_desc2'.tr,
                    ),
                    OnBoardingWidget(
                      image: Images.onBoardThreePng,
                      title: 'onboard_title3'.tr,
                      subtitle: 'onboard_desc3'.tr,
                    ),
                  ],
                ),
              ),
              Container(
                height: Get.height,
                width: Get.width,
                color: Theme.of(context).cardColor,
                child: Column(
                  children: [
                    SizedBox(height: 60,),
                    SmoothPageIndicator(
                        effect: ExpandingDotsEffect(
                          dotHeight: 10,
                          activeDotColor: Theme.of(context).primaryColor,
                          dotWidth: 10,
                        ),
                        count: 3,
                        controller: _controller),
                    const SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "skip".tr,
                            style: interSemiBold.copyWith(
                              color:  Theme.of(context).primaryColorLight,
                              fontSize: Dimensions.fontSizeLarge,
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                if (onLastPage == false) {
                                  _controller.nextPage(
                                      duration: const Duration(
                                        milliseconds: 500,
                                      ),
                                      curve: Curves.easeIn);
                                } else {
                                  Get.to(LoginScreen());
                                }
                              },
                              child: Image.asset(Images.loginButtonPng, height: 60,
                                width: 60,)

                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: Dimensions.paddingSizeSMALL,
                    ),
                  ],
                ),
              )

            ],
          ),
        ));
  }
}