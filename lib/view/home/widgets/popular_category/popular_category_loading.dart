import 'package:flutter/material.dart';
import 'package:flutter_app/view/home/widgets/popular_category/popular_category_loading_card.dart';

class PopularCategoryLoading extends StatelessWidget {
  const PopularCategoryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => const PopularCategoryLoadingCard()),
    );
  }
}
