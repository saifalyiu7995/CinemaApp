import 'package:flutter/material.dart';
import 'package:tentwenty_cinema/routes/app_navigation.dart';

import '../../../../theme/app_colors.dart';
import '../../../../widget/button/custom_button.dart';
import '../widgets/genereChip/genere_chip.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size.height * 0.6,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://img.freepik.com/free-photo/beautiful-majestic-castle-low-angle_23-2150791571.jpg?t=st=1700302264~exp=1700305864~hmac=1abe8365114d8a544ccb00111b5c0ac6da807a1ba5eaf28829f6c20dd7b2381f&w=740"),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                    top: 60,
                    left: 10,
                    child: GestureDetector(
                      onTap: () => AppNavigation.goBack(),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 17,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Watch',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'In Theaters, December 22, 2023',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: AppColors.whiteColor),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.15),
                      child: CustomButton(
                          title: "Get Tickets",
                          color: AppColors.skyBlueColor,
                          fontColor: AppColors.whiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          minSize: const Size(130, 45),
                          onPressed: () {}),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.15),
                      child: CustomButton(
                          title: "Watch Trailers",
                          color: AppColors.skyBlueColor,
                          requireBorderColor: true,
                          showOutline: true,
                          fontColor: AppColors.whiteColor,
                          borderColor: AppColors.skyBlueColor,
                          outlineWidth: 2,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          minSize: const Size(130, 45),
                          onPressed: () {}),
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ],
            ),
          ),
          const Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  'Genres',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    GenereChip(
                      title: 'Action',
                      backgroundColor: AppColors.secondaryColor,
                    ),
                    GenereChip(
                      title: 'Romance',
                      backgroundColor: AppColors.pinkColor,
                    ),
                    GenereChip(
                      title: 'Science',
                      backgroundColor: AppColors.purpleColor,
                    ),
                    GenereChip(
                      title: 'Fiction',
                      backgroundColor: AppColors.goldColor,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Overview',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam.. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam.. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam.. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam.',
                  textAlign: TextAlign.justify,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(fontSize: 13, color: AppColors.charcoalColor),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
