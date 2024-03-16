import 'package:flutter/material.dart';

class CarosulItems extends StatelessWidget {
  const CarosulItems({
    Key? key,
    required this.imgurl,
    this.fit,
  }) : super(key: key);

  final String imgurl;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image(
            image: AssetImage(imgurl) as ImageProvider,
            fit: BoxFit.fill,
            // fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
