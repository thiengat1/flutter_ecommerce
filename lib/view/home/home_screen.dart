import 'package:flutter/material.dart';
import 'package:flutter_app/controller/controller.dart';
import 'package:flutter_app/view/home/widgets/carousel_slider/carousel_loading.dart';
import 'package:flutter_app/view/home/widgets/carousel_slider/carousel_sliver_view.dart';
import 'package:flutter_app/view/home/widgets/popular_category/popular_category.dart';
import 'package:flutter_app/view/home/widgets/popular_category/popular_category_loading.dart';
import 'package:flutter_app/view/home/widgets/popular_product/popular_product.dart';
import 'package:flutter_app/view/home/widgets/popular_product/popular_product_loading.dart';
import 'package:flutter_app/view/home/widgets/section_title.dart';
import 'package:flutter_app/widgets/main_header.dart';
import 'package:get/get.dart';

class HomeScree extends StatelessWidget {
  const HomeScree({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        const MainHeader(),
        Expanded(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            Obx(() {
              if (homeController.bannerList.isNotEmpty) {
                return CarouselSliverView(
                  bannerList: homeController.bannerList,
                );
              } else {
                return const CarouselLoading();
              }
            }),
            const SectionTitle(title: "Popular Category"),
            Obx(() {
              if (homeController.popularCategoryList.isNotEmpty) {
                return PopularCategory(
                    categories: homeController.popularCategoryList);
              } else {
                return const PopularCategoryLoading();
              }
            }),
            const SectionTitle(title: "Popular Product"),
            Obx(() {
              if (homeController.popularProductList.isNotEmpty) {
                return PopularProduct(
                  popularProducts: homeController.popularProductList,
                );
              } else {
                return const PopularProductLoading();
              }
            }),
          ]),
        ))
      ],
    ));
  }
}
