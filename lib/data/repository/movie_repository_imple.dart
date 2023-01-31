import 'package:movie_search/domain/model/movie.dart';
import 'package:movie_search/domain/model/movie_dto.dart';
import 'package:movie_search/domain/repository/movie_api_repository.dart';

import '../../domain/repository/movie_repository.dart';

class MovieRepositoryImple implements MovieRepository {
  final MovieApiRepository _api;
  MovieRepositoryImple(this._api);

  @override
  Future<List<Movie>> getResult() async {
    MovieDto movieDto = await _api.getMovieList();

    if (movieDto.results == null) {
      return [];
    }

    final filteredList = movieDto.results!
        .where((element) => element.posterPath != null && element.backdropPath != null)
        .map((e) {
      return Movie(
        id: e.id ?? 0,
        adult: e.adult ?? false,
        backdropPath: 'https://image.tmdb.org/t/p/w500${e.backdropPath}',
        originalTitle: e.originalTitle ?? '',
        overview: e.overview ?? '',
        popularity: e.popularity ?? 0,
        posterPath: 'https://image.tmdb.org/t/p/w500${e.posterPath}',
        releaseDate: e.releaseDate ?? '',
        title: e.title ?? '',
        voteAverage: e.voteAverage ?? 0,
      );
    }).toList();

    return filteredList;
  }

  @override
  Future<List<Movie>> getSearchResult(String query) async {
    final movieDto = await _api.getSearchMovieList(query);

    if (movieDto.results == null) {
      return [];
    }

    return movieDto.results!.where((element) => element.posterPath != null && element.backdropPath != null).map(
      (e) {
        return Movie(
          id: e.id ?? 0,
          adult: e.adult ?? false,
          backdropPath: 'https://image.tmdb.org/t/p/w500${e.backdropPath}',
          originalTitle: e.originalTitle ?? '',
          overview: e.overview ?? '',
          popularity: e.popularity ?? 0,
          posterPath: 'https://image.tmdb.org/t/p/w500${e.posterPath}',
          releaseDate: e.releaseDate ?? '',
          title: e.title ?? '',
          voteAverage: e.voteAverage ?? 0,
        );
      },
    ).toList();
  }

  @override
  Future<List<Movie>> getSortedResultByReleasedDate() async {
    final movies = await getResult();
    movies.sort((b, a) => a.releaseDate.compareTo(b.releaseDate));
    return movies;
  }

  @override
  Future<List<Movie>> getSortedResultByTitle() async {
    final movies = await getResult();
    movies.sort((a, b) => a.originalTitle.compareTo(b.originalTitle));
    return movies;
  }

  @override
  Future<List<Movie>> getSortedResultByVoteAverage() async {
    final movies = await getResult();
    movies.sort((a, b) => a.voteAverage.compareTo(b.voteAverage));
    return movies;
  }
}
