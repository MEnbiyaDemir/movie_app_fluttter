class Movie {
  bool? adult;
  Map? genre;
  int? id;
  String? title;
  String? overview;
  int? popularity;
  String? status;
  String? poster_path;
  String? release_date;
  String? language;
  double? vote_average;

  Movie(
      this.adult,
      this.genre,
      this.id,
      this.title,
      this.overview,
      this.popularity,
      this.status,
      this.poster_path,
      this.release_date,
      this.language,
      this.vote_average);
}
