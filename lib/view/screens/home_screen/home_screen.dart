import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopzy_grocery_user/controller/banner_controller.dart';
import 'package:shopzy_grocery_user/controller/category_controller.dart';
import 'package:shopzy_grocery_user/controller/favorite_controller.dart';
import 'package:shopzy_grocery_user/controller/product_controller.dart';
import 'package:shopzy_grocery_user/data/model/response/productDetails_model.dart';
import 'package:shopzy_grocery_user/helper/responsive_helper.dart';
import 'package:shopzy_grocery_user/helper/route_helper.dart';
import 'package:shopzy_grocery_user/utils/app_constants.dart';
import 'package:shopzy_grocery_user/utils/dimensions.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_image.dart';
import 'package:shopzy_grocery_user/view/base/custom_loader.dart';
import 'package:shopzy_grocery_user/view/base/custom_seeall_button.dart';
import 'package:shopzy_grocery_user/view/screens/category/all_category_screen.dart';
import 'package:shopzy_grocery_user/view/screens/category/widget/category_widget.dart';
import 'package:shopzy_grocery_user/view/screens/home_screen/widget/Big_items_widget.dart';
import 'package:shopzy_grocery_user/view/screens/home_screen/widget/carousel_slider_indicator.dart';
import 'package:shopzy_grocery_user/view/screens/home_screen/widget/favourite_items_widget.dart';
import 'package:shopzy_grocery_user/view/screens/home_screen/widget/featured_item_widget.dart';
import 'package:shopzy_grocery_user/view/screens/home_screen/widget/popular_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences prefs;
  String? token;
  ProductDetails productDetails = ProductDetails();

  @override
  void initState() {
    super.initState();
    //  initSharedPreferences();
    Get.find<CategoryController>().getTopCategoryList(true);
    Get.find<BannerController>().getBannerList();
    Get.find<ProductController>().getRecomProductList(true);
    Get.find<ProductController>().getFeatProductList(true);
    Get.find<ProductController>().getPopularProductList(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        body: RefreshIndicator(
          onRefresh: () async {
            await Get.find<CategoryController>().getTopCategoryList(true);
            await Get.find<BannerController>().getBannerList();
            await Get.find<ProductController>().getRecomProductList(true);
            await Get.find<ProductController>().getFeatProductList(true);
            await Get.find<ProductController>().getPopularProductList(true);
          },
          child: GetBuilder<CategoryController>(builder: (categoryController) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 380,
                        child: Stack(
                          children: [
                            Container(
                              height: 300,
                              width: Get.width,
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(50),
                                      bottomLeft: Radius.circular(50))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Hi Eric",
                                              style: interSemiBold.copyWith(
                                                  color: Theme.of(context)
                                                      .disabledColor,
                                                  fontSize: 16),
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "W3SQ +V9H, Subash nagar , jwalapur.....",
                                                  style: interRegular.copyWith(
                                                      color: Theme.of(context)
                                                          .hintColor,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Image.asset(
                                            Images.cartPng,
                                            height: 35,
                                            width: 35,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              height: 50,
                                              width: Get.width,
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .cardColor,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                      color: Theme.of(context)
                                                          .hintColor,
                                                      width: 1)),
                                              child: Row(
                                                children: [
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  const Icon(Icons.search),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    "search_items".tr,
                                                    style:
                                                        interRegular.copyWith(
                                                            color: Theme.of(
                                                                    context)
                                                                .hintColor,
                                                            fontSize: 12),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Image.asset(
                                            Images.notificationPng,
                                            width: 30,
                                            height: 30,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CustomSeeAllButton(
                                        title: "all_categories".tr,
                                        onPressed: () {
                                          Get.to(const AllCategoryScreen());
                                        }),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: SizedBox(
                                    height: 130,
                                    width: Get.width,
                                    child: GetBuilder<CategoryController>(
                                      builder: (categoryController) {
                                        return categoryController
                                                    .categoryData !=
                                                null
                                            ? ListView.builder(
                                                physics:
                                                    const AlwaysScrollableScrollPhysics(),
                                                itemCount: categoryController
                                                    .categoryData!.length,
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 12),
                                                    child: CategoryWidget(
                                                        categoryName:
                                                            categoryController
                                                                .categoryData![
                                                                    index]
                                                                .name,
                                                        categoryImage:
                                                            '${AppConstants.imageBaseurl}${categoryController.categoryData![index].image}'),
                                                  );
                                                },
                                              )
                                            : const CustomLoader();
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // BannerViewScreen(),
                      // const CarouselSliderWithIndicator()
                      GetBuilder<BannerController>(builder: (bannerController) {
                        return bannerController.bannerDataList !=null? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CarouselSlider.builder(
                              itemCount: bannerController.bannerDataList!.length,
                              itemBuilder: (context, index, realIndex) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      height:
                                          ResponsiveHelper.isDesktop(context)
                                              ? 440
                                              : 140,
                                      decoration: const BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 4,
                                              offset: Offset(0, 4),
                                            )
                                          ],
                                          color: Colors.lightBlueAccent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      margin: const EdgeInsets.only(right: 20),
                                      child: CustomImage(
                                        image:
                                            '${bannerController.bannerDataList![index].imageUrl}',
                                        fit: BoxFit.fill,
                                      )),
                                );
                              },
                              options: CarouselOptions(
                                  enlargeStrategy:
                                      CenterPageEnlargeStrategy.zoom,
                                  height: ResponsiveHelper.isDesktop(context)
                                      ? 400
                                      : 160,
                                  padEnds: true,
                                  enableInfiniteScroll: false,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.35,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 7),
                                  onPageChanged: (index, reason) {
                                    //  bannerController.setCurrentIndex(index,
                                    //   notify: true
                                    //   );
                                  }),
                            ),
                            const SizedBox(height: Dimensions.paddingSizeSMALL),
                            Container(
                              padding: const EdgeInsets.only(
                                left: 5,
                              ),
                              height: Dimensions.paddingSizeSMALL,
                              child: ListView.builder(
                                  itemCount: 5,
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) =>
                                      AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        height: 8,
                                        // width: index == bannerController.currentIndex
                                        //     ? 15
                                        //     : 10,
                                        width: 10,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 3),
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            // index == bannerController.currentIndex
                                            //     ? Get.theme.primaryColor
                                            //     : Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      )),
                            )
                          ],
                        ):const CustomLoader();
                      })
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomSeeAllButton(
                            title: "favourite_items".tr,
                            onPressed: () {
                              Get.toNamed(RouteHelper.getFavoriteRoute());
                            }),
                        SizedBox(
                          height: 250,
                          child: GetBuilder<FavoriteController>(
                            builder: (favoriteController) {
                              return favoriteController.favoriteProducts != null
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 10,
                                      itemBuilder: (context, index) {
                                        ProductDetails data = Get.find<
                                                CategoryController>()
                                            .getProductDetails(
                                                0,
                                                favoriteController
                                                    .favoriteProducts![index]
                                                    .id!) as ProductDetails;
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(right: 15),
                                          child: FavouriteItemsWidget(
                                            productId: data.id,
                                            image_url: data.imageUrl,
                                            productName: data.name,
                                          ),
                                        );
                                      })
                                  : const CustomLoader();
                            },
                          ),
                        ),
                        CustomSeeAllButton(
                            title: "recommend_you".tr, onPressed: () {}),
                        SizedBox(
                            height: 150,
                            child: GetBuilder<ProductController>(
                              builder: (productController) {
                                return productController
                                            .recommendProductsList !=
                                        null
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: productController
                                            .recommendProductsList!.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15),
                                            child: BigItemsWidget(
                                              productName: productController
                                                  .recommendProductsList![index]
                                                  .name!,
                                              image: productController
                                                  .recommendProductsList![index]
                                                  .imageUrl!,
                                              actualPrice: productController
                                                  .recommendProductsList![index]
                                                  .price!,
                                              discountPercentage:
                                                  productController
                                                      .recommendProductsList![
                                                          index]
                                                      .discount!,
                                            ),
                                          );
                                        })
                                    : const CustomLoader();
                              },
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 150,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Image.asset(Images.offerPng),
                                );
                              }),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomSeeAllButton(
                            title: "popular_items".tr, onPressed: () {}),
                        SizedBox(
                            height: 250,
                            child: GetBuilder<ProductController>(
                              builder: (productController) {
                                return productController.popularProducts != null
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: productController
                                            .popularProducts!.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15),
                                            child: productController
                                                        .popularProducts !=
                                                    null
                                                ? PopularItemsWidget(
                                                    productName:
                                                        productController
                                                            .popularProducts![
                                                                index]
                                                            .name,
                                                    image: productController
                                                        .popularProducts![index]
                                                        .imageUrl,
                                                    index: index,
                                                    productId: productController
                                                        .popularProducts![index]
                                                        .id,
                                                    actualPrice:
                                                        productController
                                                            .popularProducts![
                                                                index]
                                                            .price,
                                                    discountPercentage:
                                                        productController
                                                            .popularProducts![
                                                                index]
                                                            .discount,
                                                  )
                                                : const CustomLoader(),
                                          );
                                        })
                                    : const CustomLoader();
                              },
                            )),
                        CustomSeeAllButton(
                            title: "featured_products".tr, onPressed: () {}),
                        SizedBox(
                          height: 150,
                          child: GetBuilder<ProductController>(
                            builder: (productController) {
                              return productController.featuredProductsList !=
                                      null
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: productController
                                          .featuredProductsList!.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(right: 15),
                                          child: FeaturedProduct(
                                            productName: productController
                                                .featuredProductsList![index]
                                                .name,
                                            image: productController
                                                .featuredProductsList![index]
                                                .imageUrl,
                                            actualPrice: productController
                                                .featuredProductsList![index]
                                                .price!,
                                            discountPercentage:
                                                productController
                                                    .featuredProductsList![
                                                        index]
                                                    .discount!,
                                          ),
                                        );
                                      })
                                  : const CustomLoader();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 150,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ));
  }
}
