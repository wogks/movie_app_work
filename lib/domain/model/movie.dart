// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';

part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required num id,
    required bool adult,
    @JsonKey(name: 'backdrop_path') required String backdropPath,
    @JsonKey(name: 'original_title') required String originalTitle,
    required String overview,
    required num popularity,
    @JsonKey(name: 'poster_path') required String posterPath,
    @JsonKey(name: 'release_date') required String releaseDate,
    required String title,
    @JsonKey(name: 'vote_average') required num voteAverage,
  }) = _Movie;

  factory Movie.fromJson(Map<String, Object?> json) => _$MovieFromJson(json);
}
