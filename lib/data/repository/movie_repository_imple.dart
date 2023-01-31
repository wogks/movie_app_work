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

    final filterList = movieDto.results.map((e) {
      return Movie(
          id: e.id,
          adult: e.adult,
          backdropPath: 'https://image.tmdb.org/t/p/w500${e.backdropPath}',
          originalTitle: e.originalTitle,
          overview: e.overview,
          popularity: e.popularity,
          posterPath: 'https://image.tmdb.org/t/p/w500${e.posterPath}',
          releaseDate: e.releaseDate,
          title: e.title,
          voteAverage: e.voteAverage ?? 0);
    }).toList();
    return filterList;
  }

  @override
  Future<List<Movie>> getSearchResult(String query) async {
    final movieDto = await _api.getSearchMovieList(query);
    return movieDto.results.map((e) {
      return Movie(
          id: e.id,
          adult: e.adult,
          backdropPath: 'https://image.tmdb.org/t/p/w500${e.backdropPath}',
          originalTitle: e.originalTitle,
          overview: e.overview,
          popularity: e.popularity,
          posterPath: 'https://image.tmdb.org/t/p/w500${e.posterPath}',
          releaseDate: e.releaseDate,
          title: e.title,
          voteAverage: e.voteAverage ?? 0);
    }).toList();
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
