// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

// const uuid = Uuid();

class Category {
  final String id;
  final String image;
  final String name;

  Category({
    required this.id,
    required this.image,
    required this.name,
  });
}
