import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/product.dart';
import 'package:flutter_app/view/product_detail/widgets/product_carousel_slider.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  NumberFormat formatter = NumberFormat('00');
  int _qty = 1;
  int _tagIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ProductCarouselSlider(
            images: widget.product.images,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.product.name,
              style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '\$${widget.product.tags.first.price.toStringAsFixed(2)}',
              style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: Row(children: [
                    InkWell(
                      onTap: () {
                        if (_qty > 1) {
                          setState(() {
                            _qty--;
                          });
                        }
                      },
                      child: Icon(
                        Icons.keyboard_arrow_left_sharp,
                        size: 32,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    Text(
                      formatter.format(_qty),
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _qty++;
                        });
                      },
                      child: Icon(
                        Icons.keyboard_arrow_right_sharp,
                        size: 32,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ]),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: Row(children: [
                    InkWell(
                      onTap: () {
                        if (_tagIndex > 0) {
                          setState(() {
                            _tagIndex--;
                          });
                        }
                      },
                      child: Icon(
                        Icons.keyboard_arrow_left_sharp,
                        size: 32,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    Text(
                      widget.product.tags[_tagIndex].title,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (_tagIndex != (widget.product.tags.length - 1)) {
                          setState(() {
                            _tagIndex++;
                          });
                        }
                      },
                      child: Icon(
                        Icons.keyboard_arrow_right_sharp,
                        size: 32,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'About this product:',
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(widget.product.description),
          )
        ]),
      ),
      bottomNavigationBar: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor:
              MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
        ),
        onPressed: () {},
        child: const Padding(
          padding: EdgeInsets.all(6),
          child: Text(
            'Add to card',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
