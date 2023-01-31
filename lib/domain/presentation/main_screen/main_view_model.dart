import 'package:flutter/material.dart';
import 'package:movie_search/data/repository/movie_api_repository_imple.dart';
import 'package:movie_search/data/repository/movie_repository_imple.dart';

import '../../model/movie.dart';

class MainViewModel extends ChangeNotifier {
  final repository = MovieRepositoryImple(MovieApiRepositoryImple());

  List<Movie> movieList = [];
  List<Movie> movieSearchList = [];
  List<Movie> sortedByTitle = [];
  List<Movie> sortedByVoteAverage = [];
  List<Movie> sortedByRealseDate = [];
  MainViewModel() {
    getList();
    getSortedListByTitle();
    getSortedByAverage();
    getSortedByRealseDate();
    notifyListeners();
  }

  Future getList() async {
    movieList = await repository.getResult();
    notifyListeners();
  }

  Future getSearchList(String query) async {
    movieSearchList = await repository.getSearchResult(query);
    notifyListeners();
  }

  Future getSortedListByTitle() async {
    sortedByTitle = await repository.getSortedResultByTitle();
    notifyListeners();
  }

  Future getSortedByAverage() async {
    sortedByVoteAverage = await repository.getSortedResultByVoteAverage();
    notifyListeners();
  }

  Future getSortedByRealseDate() async {
    sortedByRealseDate = await repository.getSortedResultByReleasedDate();
    notifyListeners();
  }
}
