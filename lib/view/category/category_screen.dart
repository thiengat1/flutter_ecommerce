import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/controller/controller.dart';
import 'package:flutter_app/view/category/widgets/category_card.dart';
import 'package:flutter_app/view/category/widgets/category_loading_card.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (categoryController.categoryList.isNotEmpty) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: categoryController.categoryList.length,
          itemBuilder: (context, index) =>
              CategoryCard(category: categoryController.categoryList[index]),
        );
      } else {
        return const CategoryLoadingCard();
      }
    });
  }
}
