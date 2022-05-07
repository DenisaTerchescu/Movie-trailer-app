import 'package:flutter_movie_ui/models/movie_model.dart';
import 'package:dio/dio.dart';

final client = Dio();

class SearchMovies {
  Future<MovieModel>? searchMovieByName(String name) async {
    try {
      final response = await client.get(
          "https://api.themoviedb.org/3/search/movie?api_key=e0619f5bb48e2cb4caa46eed0d8f73ca&query=$name");
      var body = response.data;

      int id = body["results"][0]["id"];

      final responseTrailer = await Dio().get(
          "https://api.themoviedb.org/3/movie/$id/videos?api_key=e0619f5bb48e2cb4caa46eed0d8f73ca");
      var bodyTrailer = responseTrailer.data;

      return MovieModel.fromJsonSearchMovie(body["results"][0], bodyTrailer);
    } catch (exception) {
      print(exception);
      rethrow;
    }
  }
}
