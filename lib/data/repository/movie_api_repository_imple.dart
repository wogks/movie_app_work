import 'dart:convert';
import 'package:movie_search/domain/model/movie_dto.dart';

import '../../domain/repository/movie_api_repository.dart';
import 'package:http/http.dart' as http;

class MovieApiRepositoryImple implements MovieApiRepository {
  @override
  Future<MovieDto> getMovieList() async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1');

    final response = await http.get(url);

    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);

    return MovieDto.fromJson(json);
  }

  @override
  Future<MovieDto> getSearchMovieList(String query) async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/search/movie?language=ko-KR&api_key=a64533e7ece6c72731da47c9c8bc691f&query=$query');

    final response = await http.get(url);

    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);

    return MovieDto.fromJson(json);
  }
}
