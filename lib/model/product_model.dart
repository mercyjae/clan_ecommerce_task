
import 'package:flutter/material.dart';

class Products {
   final String id;
  final String name;
  final double price;
  final String rating;
  final String image;
  final String category;
  final String description;
  final String color;
  final double previousPrice;
   int quantity;

  Products(  {
    required this.id,
    required this.name,
    required this.price,
    required this.rating,
    required this.image,
    required this.category,
    required this.description,
    required this.color,
    required this.previousPrice,
    this.quantity = 1

  });
}


