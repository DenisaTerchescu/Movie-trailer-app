List<MovieModel> topMovieList = [];
List<MovieModel> searchMovieList = [];
List<MovieModel> bookmarkMovieList = [];
List<MovieModel> moreMovieList = [];

class MovieModel {
  String? title;
  double? rating;
  String? image;
  String? year;
  List<String>? genres;
  String? summary;
  String? key;

  MovieModel({
    this.title,
    this.rating,
    this.year,
    this.image,
    this.genres,
    this.summary,
  });

  String? get getKey {
    return key;
  }

  MovieModel.fromJson(
      Map<String, dynamic> json, Map<String, dynamic> jsonTrailer) {
        title = json["title"];
        rating = json["vote_average"];
        image = 'https://image.tmdb.org/t/p/w300' + json["poster_path"];
        year = json["release_date"].substring(0, 4);
        genres = [json["genres"][0]["name"], 'Action'];
        summary = json["overview"];
        key = jsonTrailer["results"][0]["key"];
  }

  MovieModel.fromJsonSearchMovie(
      Map<String, dynamic> json, Map<String, dynamic> jsonTrailer) {
        title = json["title"];
        rating = json["vote_average"];
        image = 'https://image.tmdb.org/t/p/w300' + json["poster_path"];
        year = json["release_date"].substring(0, 4);
        genres = ['Action', 'Drama'];
        summary = json["overview"];
        key = jsonTrailer["results"][0]["key"];
  }
}
