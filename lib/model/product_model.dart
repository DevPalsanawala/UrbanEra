// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

List<Products> productsFromJson(String str) =>
    List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  int productid;
  int category;
  String img;
  String title;
  String subtitle;
  int price;
  int mrp;
  dynamic createdAt;
  dynamic updatedAt;

  Products({
    required this.productid,
    required this.category,
    required this.img,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.mrp,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        productid: json["productid"],
        category: json["category"],
        img: json["img"],
        title: json["title"],
        subtitle: json["subtitle"],
        price: json["price"],
        mrp: json["mrp"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "productid": productid,
        "category": category,
        "img": img,
        "title": title,
        "subtitle": subtitle,
        "price": price,
        "mrp": mrp,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
