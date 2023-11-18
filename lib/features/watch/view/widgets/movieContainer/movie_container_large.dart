import 'package:flutter/material.dart';

import '../../../../../theme/app_colors.dart';

class MovieBannerWidget extends StatelessWidget {
  final bool isCategories;
  final String title;
  final String image;
  const MovieBannerWidget({
    super.key,
    this.isCategories = false,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: isCategories ? 140 : 200,
          width: isCategories ? size.width * 0.5 : double.infinity,
          margin: EdgeInsets.symmetric(
            horizontal: isCategories ? 5 : 10,
            vertical: isCategories ? 5 : 10,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.greyColor,
              image: DecorationImage(
                image: NetworkImage(image), // Replace with your image asset
                fit: BoxFit.cover,
              )),
        ),
        Container(
          height: isCategories ? 140 : 200,
          width: isCategories ? size.width * 0.5 : double.infinity,
          margin: EdgeInsets.symmetric(
            horizontal: isCategories ? 5 : 10,
            vertical: isCategories ? 5 : 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.black.withOpacity(0.9), Colors.transparent],
            ),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isCategories ? 16 : 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
