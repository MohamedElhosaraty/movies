import 'package:flutter/material.dart';
import 'package:movies/features/movies/presentation/views/screen/custom_categories.dart';
import 'package:movies/features/movies/presentation/views/screen/custom_listview_image.dart';
import 'package:movies/features/movies/presentation/views/screen/custom_slider.dart';

class MoviesViewBody extends StatelessWidget {
  const MoviesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      key: Key('movieScrollView'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSliderAnimated(),
          CustomCategories(
              title: "Popular"),
          CustomListviewImage(),
          CustomCategories(
              title: "Top Rated"),
          CustomListviewImage(),
          SizedBox(
              height: 50.0),
        ],
      ),
    );
  }
}
