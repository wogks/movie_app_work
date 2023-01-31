import 'package:flutter/material.dart';
import 'package:movie_search/domain/model/movie.dart';
import 'package:movie_search/domain/presentation/movie_detatil_screen/movie_detatil_screen.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movieList;
  final String filterTitle;
  const MovieList(
      {super.key, required this.movieList, required this.filterTitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                filterTitle,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: movieList.length,
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      final movie = movieList[index];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailScreen(movie: movie),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                       child: Image.network(
                        movieList[index].posterPath,
                        width: 130,
                        height: 200,
                        fit: BoxFit.cover,
                       ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
