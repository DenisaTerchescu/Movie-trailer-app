

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_ui/services/MovieService.dart';
import '../models/movie_model.dart';
import '../widgets/horizontal_movie_card.dart';
import '../widgets/vertical_movie_card.dart';
import 'package:octo_image/octo_image.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    const String _imgProfile =
        'https://i.pinimg.com/564x/7c/7f/94/7c7f94722aad3469ee691074772b505c.jpg';

    MovieService client = MovieService();
    //
    // MovieModel? data  = new MovieModel(
    //   title: 'Black Widow',
    //   rating: 4.7,
    //   genres: ['Action','Advanture','Sci-Fi'],
    //   image: 'https://i.pinimg.com/564x/6d/34/c5/6d34c5fab92849061a8e35840878b742.jpg',
    //   summary: "Natasha Romanoff confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises.",
    // );
    // MovieModel? data1  = new MovieModel(
    //   title: 'Black Widow',
    //   rating: 4.7,
    //   genres: ['Action','Advanture','Sci-Fi'],
    //   image: 'https://i.pinimg.com/564x/6d/34/c5/6d34c5fab92849061a8e35840878b742.jpg',
    //   summary: "Natasha Romanoff confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises.",
    // );
    // MovieModel? data2  = new MovieModel(
    //   title: 'Black Widow',
    //   rating: 4.7,
    //   genres: ['Action','Advanture','Sci-Fi'],
    //   image: 'https://i.pinimg.com/564x/6d/34/c5/6d34c5fab92849061a8e35840878b742.jpg',
    //   summary: "Natasha Romanoff confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises.",
    // );
    // MovieModel? data3  = new MovieModel(
    //   title: 'Black Widow',
    //   rating: 4.7,
    //   genres: ['Action','Advanture','Sci-Fi'],
    //   image: 'https://i.pinimg.com/564x/6d/34/c5/6d34c5fab92849061a8e35840878b742.jpg',
    //   summary: "Natasha Romanoff confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises.",
    // );
    // MovieModel? data4  = new MovieModel(
    //   title: 'Black Widow',
    //   rating: 4.7,
    //   genres: ['Action','Advanture','Sci-Fi'],
    //   image: 'https://i.pinimg.com/564x/6d/34/c5/6d34c5fab92849061a8e35840878b742.jpg',
    //   summary: "Natasha Romanoff confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises.",
    // );



    // MovieModel? data1 = new MovieModel(
    //   title: 'Nope nope nope',
    //   rating: 4.7,
    //   // year: "2015",
    //   genres: ['Action','Advanture','Sci-Fi'],
    //   image: 'https://i.pinimg.com/564x/6d/34/c5/6d34c5fab92849061a8e35840878b742.jpg',
    //   summary: "Natasha Romanoff confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises.",
    // );


   //
    Future<void> getData() async{
      MovieModel? data = await client.getCurrentMovie("559");
      MovieModel? data1 = await client.getCurrentMovie("335787");
      MovieModel? data2 = await client.getCurrentMovie("58");
      MovieModel? data3 = await client.getCurrentMovie("23398");
      MovieModel? data4 = await client.getCurrentMovie("120");
      //   topMovieList.add(data!);
      // data = await client.getCurrentMovie("550");
      // topMovieList.add(await client.getCurrentMovie("335787")!);
      //
      // topMovieList.add(await client.getCurrentMovie("58")!);
      //
      // topMovieList.add(await client.getCurrentMovie("23398")!);
      //
      // topMovieList.add(await client.getCurrentMovie("550")!);
      //
      // topMovieList.add(await client.getCurrentMovie("120")!);
      topMovieList.add(data!);
      topMovieList.add(data1!);
      topMovieList.add(data2!);
      topMovieList.add(data3!);
      topMovieList.add(data4!);

      topMovieList = topMovieList.toSet().toList();

    }

    // topMovieList.add(data);
    // getData();
    @override
    void initState() {
      super.initState();
      // getData();
    }

    return FutureBuilder(
      future: getData(),
      builder : (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            children: [
              //BUILD MAIN CONTENT
              Positioned.fill(
                top: 120.0,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Top Movies', style: _theme.textTheme.headline1),
                          Text('See more', style: _theme.textTheme.subtitle1),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Container(
                      width: double.infinity,
                      height: 310.0,
                      child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        itemBuilder: (context, index) {
                          var _movie = topMovieList[index];
                          return HorizontalMovieCard(movie: _movie);
                        },
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('TV Series', style: _theme.textTheme.headline1),
                          Text('See more', style: _theme.textTheme.subtitle1),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      itemBuilder: (context, index) {
                        var _movie = topMovieList[index];
                        return VerticalMovieCard(movie: _movie);
                      },
                    )
                  ],
                ),
              ),

              // BUILD APPBAR
              _BuildAppBar(imgProfile: _imgProfile)
            ],
          );
        }
        else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(),);
        }
        return Container();
      } );
  }
}

class _BuildAppBar extends StatelessWidget {
  final String imgProfile;

  const _BuildAppBar({Key? key, required this.imgProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Positioned(
      top: 18.0,
      left: 0.0,
      right: 0.0,
      child: Container(
        color: _theme.backgroundColor,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 18.0),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: OctoImage(
              image: CachedNetworkImageProvider(imgProfile),
              width: 50.0,
              height: 50.0,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            'Good Morning',
            style: _theme.textTheme.subtitle2,
          ),
          subtitle: Text(
            'Roxie',
            style: _theme.textTheme.headline2,
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          ),
        ),
      ),
    );
  }
}
