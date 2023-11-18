import 'package:flutter/material.dart';

import '../../../../routes/app_navigation.dart';
import '../../../../routes/app_navigation_routes.dart';
import '../../../../widget/appbar/appbar_widget.dart';
import '../../../watch/view/widgets/movieContainer/movie_container_large.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Dashboard"),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => GestureDetector(
            onTap: () => AppNavigation.navigateTo(AppNavRoutes.detailsRoute),
            child: MovieBannerWidget(
              image: list[index]["image"],
              title: list[index]["title"],
            )),
      ),
    );
  }
}

final List<Map<String, dynamic>> list = [
  {
    "title": "Game of Thrones",
    "image":
        'https://img.freepik.com/free-photo/dragons-fantasy-artificial-intelligence-image_23-2150400883.jpg?t=st=1700291495~exp=1700295095~hmac=1ba56b0d2ff9df3e30b95bc01af8e5d6454da2f35febd230cb73f78ede10515e&w=1380',
  },
  {
    "title": "Rick and Morty",
    "image":
        'https://m.media-amazon.com/images/M/MV5BM2ExNmYyZjctMWZiNC00MjUxLWI4NDAtYWQ2OTJhMGZmNGI3XkEyXkFqcGdeQXNvbG5vbXM@._V1_QL75_UX500_CR0,0,500,281_.jpg',
  },
  {
    "title": "Breaking Bad",
    "image":
        'https://www.usmagazine.com/wp-content/uploads/2020/08/Breaking-Bad-Where-Are-They-Now.jpg?quality=86&strip=all',
  },
  {
    "title": "Mind Hunter",
    "image":
        'https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p14413981_b_h10_ac.jpg',
  },
  {
    "title": "Big Mouth",
    "image":
        'https://m.media-amazon.com/images/M/MV5BZDRlZDlkYjgtYTI2Yi00NTljLWJlNTMtYmU1ODBmZjFlNTk4XkEyXkFqcGdeQXVyOTYyMTY2NzQ@._V1_FMjpg_UX1000_.jpg',
  },
];
