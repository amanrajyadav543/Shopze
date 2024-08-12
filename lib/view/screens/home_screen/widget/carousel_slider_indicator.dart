import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/controller/banner_controller.dart';
import 'package:shopzy_grocery_user/helper/responsive_helper.dart';
import 'package:shopzy_grocery_user/utils/dimensions.dart';
import 'package:shopzy_grocery_user/view/base/custom_image.dart';
import 'package:shopzy_grocery_user/view/base/custom_loader.dart';

class CarouselSliderWithIndicator extends StatefulWidget {
  const CarouselSliderWithIndicator({super.key});

  @override
  State<CarouselSliderWithIndicator> createState() =>
      _CarouselSliderWithIndicatorState();
}


class _CarouselSliderWithIndicatorState
    extends State<CarouselSliderWithIndicator> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerController>(builder: (bannerController) {
      return (bannerController.bannerDataList != null &&
              bannerController.bannerDataList!.isEmpty)
          ? const SizedBox()
          : bannerController.bannerDataList != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider.builder(
                      itemCount:  bannerController.bannerDataList?.length,
                      itemBuilder: (context, index, realIndex) {
                        return GestureDetector(
                          onTap: () {
                          },
                          child: Container(
                            height: ResponsiveHelper.isDesktop(context) ? 440:140,
                              decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                    )
                                  ],
                                  color: Colors.lightBlueAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              margin: const EdgeInsets.only(right: 20),
                             child: CustomImage(
                                image:
                                    '${bannerController.bannerDataList![index].imageUrl}',
                                fit: BoxFit.fill,
                              )

                              ),
                        );
                      },
                      options: CarouselOptions(
                          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                          height: ResponsiveHelper.isDesktop(context) ? 400 : 160,
                          padEnds: true,
                          enableInfiniteScroll: false,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.35,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 7),
                          onPageChanged: (index, reason) {
                            bannerController.setCurrentIndex(index,
                                notify: true);
                          }),
                    ),
                      const SizedBox(height: Dimensions.paddingSizeSMALL),
                    Container(
                      padding: const EdgeInsets.only(left: 5,),
                      height: Dimensions.paddingSizeSMALL,
                      child: ListView.builder(
                          itemCount: bannerController.bannerDataList!.isEmpty
                              ? 1
                              : bannerController.bannerDataList?.length,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                height: 8,
                                width: index == bannerController.currentIndex
                                    ? 15
                                    : 10,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                decoration: BoxDecoration(
                                    color:
                                        index == bannerController.currentIndex
                                            ? Get.theme.primaryColor
                                            : Colors.grey,
                                    borderRadius: BorderRadius.circular(5)),
                              )),
                    )
                  ],
                )
              : const CustomLoader();
    });
  }
}
