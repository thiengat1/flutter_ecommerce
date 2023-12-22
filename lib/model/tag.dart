import 'dart:convert';

List<Tag> tagListFromJson(String val) => List<Tag>.from(
    json.decode(val)['data'].map((product) => Tag.fromJson(product)));

class Tag {
  final int id;
  final String title;
  final double price;

  Tag({required this.id, required this.title, required this.price});

  factory Tag.fromJson(Map<String, dynamic> data) => Tag(
      id: data['id'],
      title: data['attributes']['title'],
      price: data['attributes']['price'].toDouble());
}
