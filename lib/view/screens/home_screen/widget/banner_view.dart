import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/dimensions.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/view/base/custom_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerViewScreen extends StatefulWidget {
  const BannerViewScreen({super.key});

  @override
  State<BannerViewScreen> createState() => _BannerViewScreenState();
}

class _BannerViewScreenState extends State<BannerViewScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          child: PageView(
            controller: _controller,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                  child: CustomImage(
                    image: Images.bannerPng,
                    fit: BoxFit.fill,
                    width: Get.width * 0.03,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                  child: CustomImage(
                    image: Images.bannerPng,
                    fit: BoxFit.fill,
                    width: Get.width * 0.03,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                  child: CustomImage(
                    image: Images.bannerPng,
                    fit: BoxFit.fill,
                    width: Get.width * 0.03,

                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                  child: CustomImage(
                    image: Images.bannerPng,
                    fit: BoxFit.fill,
                    width: Get.width * 0.01,

                  ),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: SmoothPageIndicator(
            effect: SwapEffect(
                activeDotColor: Get.theme.primaryColor,
                dotWidth: 10,
                dotHeight: 10
            ),
            controller: _controller, count: 4,
            // Color of unselected indicators
          ),
        ),
      ],
    );
  }

}