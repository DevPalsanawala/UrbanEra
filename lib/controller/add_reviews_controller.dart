// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/text_string.dart';

class AddReviewsController extends GetxController {
  TextEditingController addReviewsController = TextEditingController(text: TextString.feedbackString);

  final imagesAdded = false.obs;
  final selectedImages = <XFile>[].obs;
  final selectedImageIndex = (-1).obs;

  void setImagesAdded(bool value) {
    imagesAdded.value = value;
  }

  void setSelectedImages(List<XFile> images) {
    selectedImages.assignAll(images);
  }

  void setSelectedImageIndex(int index) {
    selectedImageIndex.value = index;
  }

  Future<List<XFile>> pickImages() async {
    List<XFile> resultList = [];

    try {
      resultList = await ImagePicker().pickMultiImage();
    } on Exception catch (e) {
      print(e.toString());
    }

    return resultList;
  }
}