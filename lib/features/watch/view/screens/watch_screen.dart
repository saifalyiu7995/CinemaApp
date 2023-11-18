import 'package:flutter/material.dart';
import 'package:tentwenty_cinema/features/dashboard/view/screens/dashboard_screen.dart';

import '../../../../widget/appbar/appbar_widget.dart';
import '../widgets/movieContainer/movie_container_large.dart';

class WatchScreen extends StatelessWidget {
  const WatchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Watch"),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.7,
          mainAxisSpacing: 1.2,
        ),
        itemCount: list.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => MovieBannerWidget(
          isCategories: true,
          image: list[index]["image"],
          title: list[index]["title"],
        ),
      ),
    );
  }
}
