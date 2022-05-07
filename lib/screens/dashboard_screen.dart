import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_ui/services/MovieService.dart';
import '../models/movie_model.dart';
import '../widgets/horizontal_movie_card.dart';
import '../widgets/vertical_movie_card.dart';
import 'package:octo_image/octo_image.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String imgProfile =
      'https://i.pinimg.com/280x280_RS/7d/00/a9/7d00a97b0586e2901f4ba586a7f247ce.jpg';
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    MovieService client = MovieService();

    Future<void> getData() async {

      //dashboard pentru top movie list
      MovieModel? data = await client.getCurrentMovie("559");
      MovieModel? data1 = await client.getCurrentMovie("335787");
      MovieModel? data2 = await client.getCurrentMovie("58");
      MovieModel? data3 = await client.getCurrentMovie("23398");
      MovieModel? data4 = await client.getCurrentMovie("120");

      if (topMovieList.contains(data) == false){
        topMovieList.add(data!);
      }
      if (topMovieList.contains(data1) == false){
        topMovieList.add(data1!);
      }
      if (topMovieList.contains(data2) == false){
        topMovieList.add(data2!);
      }
      if (topMovieList.contains(data4) == false){
        topMovieList.add(data4!);
      }
      if (topMovieList.contains(data3) == false){
        topMovieList.add(data3!);
      }


      //dashboard pentru a vedea mai mult filme
      MovieModel? movie1 = await client.getCurrentMovie("155");
      MovieModel? movie2 = await client.getCurrentMovie("2062");
      MovieModel? movie3 = await client.getCurrentMovie("238");
      MovieModel? movie4 = await client.getCurrentMovie("354912");
      MovieModel? movie5 = await client.getCurrentMovie("274");

      if (moreMovieList.contains(movie1) == false){
        moreMovieList.add(movie1!);
      }
      if (moreMovieList.contains(movie2) == false){
        moreMovieList.add(movie2!);
      }
      if (moreMovieList.contains(movie3) == false){
        moreMovieList.add(movie3!);
      }
      if (moreMovieList.contains(movie4) == false){
        moreMovieList.add(movie4!);
      }
      if (moreMovieList.contains(movie5) == false){
        moreMovieList.add(movie5!);
      }
     moreMovieList = moreMovieList.toSet().toList();
    }

    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
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
                            Text('Top Movies',
                                style: _theme.textTheme.headline1),
                            Text('See more', style: _theme.textTheme.subtitle1),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Container(
                        width: double.infinity,
                        height: 310.0,
                        child: ListView.builder(
                          itemCount: topMovieList.length,
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
                            Text('More awesome movies',
                                style: _theme.textTheme.headline1),
                            Text('See more', style: _theme.textTheme.subtitle1),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      ListView.builder(
                        itemCount: moreMovieList.length,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        itemBuilder: (context, index) {
                          var _movie = moreMovieList[index];
                          return VerticalMovieCard(movie: _movie);
                        },
                      )
                    ],
                  ),
                ),

                // BUILD APPBAR
                _BuildAppBar(imgProfile: imgProfile)
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          }
          return Container();
        });
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
            'Good to have you back,',
            style: _theme.textTheme.subtitle2,
          ),
          subtitle: Text(
            'Amanda',
            style: _theme.textTheme.headline2,
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu_rounded),
          ),
        ),
      ),
    );
  }
}
