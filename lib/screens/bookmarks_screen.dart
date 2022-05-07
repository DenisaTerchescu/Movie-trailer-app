import 'package:flutter_movie_ui/models/movie_model.dart';
import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../widgets/vertical_movie_card.dart';

class BookmarkedMovies extends StatefulWidget {
  const BookmarkedMovies({Key? key}) : super(key: key);

  @override
  _BookmarkedMoviesState createState() => _BookmarkedMoviesState();
}

class _BookmarkedMoviesState extends State<BookmarkedMovies> {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Stack(
      children: [
        Positioned.fill(
          top: 10.0,
          child: ListView(
            children: [
              const SizedBox(height: 35.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Bookmarked movies',
                        style: _theme.textTheme.headline1),
                    Text('See more', style: _theme.textTheme.subtitle1),
                  ],
                ),
              ),
              const SizedBox(height: 12.0),
              ListView.builder(
                itemCount: bookmarkMovieList.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                itemBuilder: (context, index) {
                  var _movie = bookmarkMovieList.elementAt(index);
                  return VerticalMovieCard(movie: _movie);
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
