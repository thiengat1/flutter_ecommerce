import 'package:flutter/material.dart';
import 'package:flutter_app/model/product.dart';
import 'package:flutter_app/view/home/widgets/popular_product/popular_product_card.dart';

class PopularProduct extends StatelessWidget {
  final List<Product> popularProducts;
  const PopularProduct({super.key, required this.popularProducts});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
          itemCount: popularProducts.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              PopularProductCard(product: popularProducts[index])),
    );
  }
}
