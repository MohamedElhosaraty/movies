import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/features/movies/presentation/views/all_movies.dart';

import '../../../domain/entities/movies_entity.dart';

class CustomCategories extends StatelessWidget {
  const CustomCategories({super.key, required this.title, required this.movies});

  final String title;
  final List<Movie> movies ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 19,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
            ),
          ),
          InkWell(
            onTap: () {
              /// TODO : NAVIGATION TO POPULAR SCREEN
              Navigator.pushNamed(context, AllMovies.routeName,
                  arguments: movies);

            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('See More'),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
