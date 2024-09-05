import 'package:flutter/material.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/screens/tabs/browse_tab.dart';
import 'package:movies/screens/tabs/home_tab.dart';
import 'package:movies/screens/tabs/search_tab.dart';
import 'package:movies/screens/tabs/watchlist_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = "home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    WatchlistTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          selectedIndex = value;
          setState(() {});
        },
        elevation: 20,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "HOME",
              backgroundColor: AppTheme.grayBG),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "SEARCH",
              backgroundColor: AppTheme.grayBG),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/movie_icon.png"),
              ),
              label: "BROWSE",
              backgroundColor: AppTheme.grayBG),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/watchlist_icon.png"),
              ),
              label: "WATCHLIST",
              backgroundColor: AppTheme.grayBG),
        ],
      ),
    );
  }
}
