
import 'package:flutter_movie_ui/models/movie_model.dart';
import 'package:dio/dio.dart';

final client = Dio();

class MovieService{
   Future<MovieModel>? getCurrentMovie(String id) async{
    try{
      final response = await client.get("https://api.themoviedb.org/3/movie/$id?api_key=e0619f5bb48e2cb4caa46eed0d8f73ca&language=ro");
      var body = response.data;
      // print(MovieModel.fromJson(body));
      // return new MovieModel(
      //   title: 'Nope nope nope',
      //   rating: 4.1,
      //   genres: ['Action','Adventure','Comedy'],
      //   image: 'https://i.pinimg.com/564x/29/d4/cd/29d4cd3595d3ba5ee402b00150eaa683.jpg',
      //   summary: "Supervillains Harley Quinn, Bloodsport, Peacemaker and a collection of nutty cons at Belle Reve prison join the super-secret, super-shady Task Force X as they are dropped off at the remote, enemy-infused island of Corto Maltese.",
      // );
      return MovieModel.fromJson(body);
    }
    catch(Exception){
      print(Exception);
      rethrow;
    }

  }
}