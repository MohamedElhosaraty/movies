import 'package:flutter/material.dart';
import 'package:movies/features/movies/presentation/views/screen/custom_categories.dart';
import 'package:movies/features/movies/presentation/views/screen/custom_popular_listview_image.dart';
import 'package:movies/features/movies/presentation/views/screen/custom_slider.dart';
import 'package:movies/features/movies/presentation/views/screen/custom_top_rated_list_view_image.dart';

class MoviesViewBody extends StatelessWidget {
  const MoviesViewBody({super.key,});


  @override
  Widget build(BuildContext context) {
    return  const SingleChildScrollView(
      key: Key('movieScrollView'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSliderAnimated(),
          CustomCategories(
              title: "Popular"),
          CustomPopularListviewImage(),
          CustomCategories(
              title: "Top Rated"),
          CustomTopRatedListViewImage(),
          SizedBox(
              height: 50.0),
        ],
      ),
    );
  }
}
