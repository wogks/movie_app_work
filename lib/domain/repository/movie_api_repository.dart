import 'package:movie_search/domain/model/movie_dto.dart';

import '../model/movie.dart';

abstract class MovieApiRepository {
  Future<MovieDto> getMovieList();
  Future<MovieDto> getSearchMovieList(String query);
}
