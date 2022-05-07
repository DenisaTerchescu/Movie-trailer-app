import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../services/SearchMovies.dart';
import '../widgets/vertical_movie_card.dart';

String? movieName;

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var _controller = TextEditingController();

  Icon customIcon = const Icon(Icons.search);

  SearchMovies client = SearchMovies();

  Future<void> getMovieSearch() async {
    MovieModel? data;
    if (movieName != null) {
      data = await client.searchMovieByName(movieName!);
    }
    if (data != null) {
      if (searchMovieList.isNotEmpty) {
        searchMovieList.removeLast();
      }
      searchMovieList.add(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 0.0,
          title: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  enableSuggestions: true,
                  onChanged: (value) {
                    setState(() {
                      movieName = value;
                      print(movieName);
                    });
                  },
                  controller: _controller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                      hintText: "Search",
                  labelStyle: TextStyle(
                    color: Colors.white
                  )),

                ),
              ),
            ],
          ),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu_rounded, size: 25),
            color: Colors.white,
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        body: FutureBuilder(
            future: getMovieSearch(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Stack(
                  children: [
                    //BUILD MAIN CONTENT
                    Positioned.fill(
                      top: 10.0,
                      child: ListView(
                        children: [
                          const SizedBox(height: 12.0),
                          const SizedBox(height: 25.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Results',
                                    style: _theme.textTheme.headline1),
                                Text('See more',
                                    style: _theme.textTheme.subtitle1),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12.0),
                          ListView.builder(
                            itemCount: searchMovieList.length,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            itemBuilder: (context, index) {
                              var _movie = searchMovieList[index];
                              return VerticalMovieCard(movie: _movie);
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container();
            }));
  }
}
