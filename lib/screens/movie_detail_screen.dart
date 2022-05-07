import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_movie_ui/widgets/Video.dart';
import 'package:octo_image/octo_image.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:like_button/like_button.dart';
import '../models/movie_model.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieModel movie;

  const MovieDetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  goToYoutube(String url) async {
    try {
      await launchUrlString(url);
    } on Exception catch (exception) {
      print(exception);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Movie', style: _theme.textTheme.headline2),
        actions: [
          LikeButton(
            size: 35,
            circleColor:
                CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
            bubblesColor: BubblesColor(
              dotPrimaryColor: Color(0xff33b5e5),
              dotSecondaryColor: Color(0xff0099cc),
            ),
            likeBuilder: (bool isLiked) {
              if (bookmarkMovieList.contains(widget.movie) == false) {
                bookmarkMovieList.add(widget.movie);
              }
              return Icon(
                Icons.bookmark_border_outlined,
                color: isLiked ? Colors.deepPurpleAccent : Colors.white70,
                size: 35,
              );
            },
            countBuilder: (int? count, bool isLiked, String text) {
              return null;
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        children: [
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: OctoImage(
                image: CachedNetworkImageProvider(widget.movie.image!),
                height: 500.0,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          Text(widget.movie.title ?? '', style: _theme.textTheme.headline1),
          const SizedBox(height: 8.0),
          OverflowBar(children: [
            Row(
              children: [
                Text('Year: ${widget.movie.year!} | ',
                    style: _theme.textTheme.bodyText1),
                Icon(
                  Icons.star,
                  color: Color(0xFFFFA235),
                  size: 14.0,
                ),
                Text(' ${widget.movie.rating} ',
                    style: _theme.textTheme.bodyText1),
                SizedBox(width: 50.0),
                LikeButton(
                  size: 25,
                  circleColor: CircleColor(
                      start: Color(0xff00ddff), end: Color(0xff0099cc)),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Color(0xff33b5e5),
                    dotSecondaryColor: Color(0xff0099cc),
                  ),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      FeatherIcons.heart,
                      color: isLiked ? Colors.amber : Colors.white70,
                      size: 25,
                    );
                  },
                  likeCount: 101,
                ),
                SizedBox(width: 10.0),
                LikeButton(
                  size: 27,
                  circleColor: CircleColor(
                      start: Color(0xff00ddff), end: Color(0xff0099cc)),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Color(0xff33b5e5),
                    dotSecondaryColor: Color(0xff0099cc),
                  ),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      IconData(0xf060f, fontFamily: 'MaterialIcons'),
                      color: isLiked ? Colors.red[900] : Colors.white70,
                      size: 27,
                    );
                  },
                  likeCount: 3,
                ),
              ],
            ),
          ]),
          const SizedBox(height: 15.0),
          Container(
            width: double.infinity,
            height: 40.0,
            child: ListView.builder(
              itemCount: widget.movie.genres?.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var _genre = widget.movie.genres![index];
                return Container(
                  height: 40.0,
                  margin: EdgeInsets.only(right: 12.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF252932),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    _genre,
                    style: _theme.textTheme.bodyText2,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 25.0),
          Text('Storyline', style: _theme.textTheme.headline1),
          const SizedBox(height: 8.0),
          ReadMoreText(
            widget.movie.summary!,
            style: _theme.textTheme.subtitle1,
            trimLines: 2,
            colorClickableText: _theme.primaryColor,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            moreStyle: _theme.textTheme.bodyText2,
            lessStyle: _theme.textTheme.bodyText2,
          ),
          const SizedBox(height: 100.0),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        height: 50.0,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.amber,
          ),
          onPressed: () {
            // goToYoutube(movie.key!);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => new Video(
                          url: widget.movie.key!,
                        )));
          },
          child: Text(
            'Watch Movie Trailer',
            style: _theme.textTheme.headline3,
          ),
        ),
      ),
    );
  }
}
