
import 'dart:convert';

import 'package:http/http.dart' as http;

class MovieModel {
 String? title;
   double? rating;
   String? image;
   String? year;
  List<String>? genres;
   String? summary;
   String? key;
  // MovieModel (Map<String, dynamic> movie)
  //     : title=movie['title'] as String,
  //       image=movie['medium_cover_image'] as String,
  //       // year=movie['year'] as int,
  //       genres=['Drama', 'Fantasy', 'Horor'],
  //       rating=(movie['rating'] as num).toDouble(),
  //       summary=movie['summary'] as String;
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

 // Creating the setter method
 // to set the input in Field/Property
 set setKey(String new_key) {
   key = new_key;
 }


 MovieModel.fromJson(Map<String, dynamic> json, Map<String, dynamic> json_trailer ){

    title = json["title"];
    rating =  json["vote_average"];
    // image = 'https://i.pinimg.com/564x/19/ff/0a/19ff0a49907d3fe9a2385ec67e201164.jpg';
    image = 'http://image.tmdb.org/t/p/w300' + json["poster_path"];
    year = json["release_date"].substring(0,4);
    genres = [json["genres"][0]["name"], 'Action'];
    summary = json["overview"];
    key = "https://www.youtube.com/watch?v=" + json_trailer["results"][0]["key"];
  }



}
// List<MovieModel> topMovieList = <MovieModel>[];

List<MovieModel> topMovieList = [
  // MovieModel(
  //   title: 'Venom: Let There Be Carnage',
  //   image:'https://i.pinimg.com/564x/19/ff/0a/19ff0a49907d3fe9a2385ec67e201164.jpg',
  //   genres: ['Action','Thriller'],
  //   year:"2015",
  //   rating: 4.8,
  //   summary: "Tom Hardy returns to the big screen as the lethal protector Venom, one of MARVEL's greatest and most complex characters. Directed by Andy Serkis, the film also stars Michelle Williams, Naomie Harris and Woody Harrelson, in the role of the villain Cletus Kasady/Carnage.",
  // ),
  // MovieModel(
  //   title: 'Stranger Things',
  //   image: 'https://i.pinimg.com/564x/28/b8/d6/28b8d6759594cc8e8d2912a0b2ec863a.jpg',
  //   genres: ['Drama', 'Fantasy', 'Horor'],
  //   summary: 'When a young boy disappears, his mother, a police chief and his friends must confront terrifying supernatural forces in order to get him back.',
  //   rating: 4.7,
  // ),
  // MovieModel(
  //   title: 'The Suicide Squad',
  //   rating: 4.7,
  //   genres: ['Action','Advanture','Comedy'],
  //   image: 'https://i.pinimg.com/564x/29/d4/cd/29d4cd3595d3ba5ee402b00150eaa683.jpg',
  //   summary: "Supervillains Harley Quinn, Bloodsport, Peacemaker and a collection of nutty cons at Belle Reve prison join the super-secret, super-shady Task Force X as they are dropped off at the remote, enemy-infused island of Corto Maltese.",
  // ),
  // MovieModel(
  //   title: 'Black Widow',
  //   rating: 4.7,
  //   genres: ['Action','Advanture','Sci-Fi'],
  //   image: 'https://i.pinimg.com/564x/6d/34/c5/6d34c5fab92849061a8e35840878b742.jpg',
  //   summary: "Natasha Romanoff confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises.",
  // ),
];

