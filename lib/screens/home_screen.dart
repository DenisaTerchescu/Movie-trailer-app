import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_ui/screens/bookmarks_screen.dart';
import 'package:flutter_movie_ui/screens/search_screen.dart';

import 'dashboard_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:octo_image/octo_image.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late PageController _controller;
  String imgProfile =
      'https://i.pinimg.com/280x280_RS/7d/00/a9/7d00a97b0586e2901f4ba586a7f247ce.jpg';
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _controller,
          onPageChanged: (v) {},
          children: [
            DashboardScreen(),
            SearchScreen(),
            BookmarkedMovies(),
            Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(70.0),
                  child: OctoImage(
                    image: CachedNetworkImageProvider(imgProfile),
                    width: 250.0,
                    height: 250.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 15.0),
                Text('Amanda', style: _theme.textTheme.headline1),
              ],
            )),
          ],
        ),
      ),
      bottomNavigationBar: DotNavigationBar(
        backgroundColor: Color(0xFF1B1E25),
        enableFloatingNavBar: false,
        currentIndex: _selectedIndex,
        onTap: (v) {
          setState(() {
            _selectedIndex = v;
            _controller.animateToPage(
              v,
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            );
          });
        },
        unselectedItemColor: Color(0xFF636882),
        items: [
          DotNavigationBarItem(
            icon: Icon(Icons.dashboard),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.search),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.bookmark_outline_outlined),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
    );
  }
}
