import 'package:flutter_movie_ui/models/movie_model.dart';
import 'package:dio/dio.dart';

final client = Dio();

class MovieService {
  Future<MovieModel>? getCurrentMovie(String id) async {
    try {
      final response = await client.get(
          "https://api.themoviedb.org/3/movie/$id?api_key=e0619f5bb48e2cb4caa46eed0d8f73ca");
      var body = response.data;

      final responseTrailer = await Dio().get(
          "https://api.themoviedb.org/3/movie/$id/videos?api_key=e0619f5bb48e2cb4caa46eed0d8f73ca");
      var bodyTrailer = responseTrailer.data;

      MovieModel m = MovieModel.fromJson(body, bodyTrailer);

      return m;
    } catch (exception) {
      print(exception);
      rethrow;
    }
  }
}
