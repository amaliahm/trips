import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trips/pages/navpages/bar_item_page.dart';
import 'package:trips/pages/home_page.dart';
import 'package:trips/pages/navpages/my_page.dart';
import 'package:trips/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = const [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];
  int current_index = 0;

  void onTap(int index) {
    setState(() {
      current_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[current_index],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        onTap: onTap,
        currentIndex: current_index,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 25,
              child: SvgPicture.asset("assets/icon/home-1-4.svg",),
            ),
            activeIcon: SizedBox(
              height: 25,
              child: SvgPicture.asset("assets/icon/home-1-2.svg",),
            ),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 25,
              child: SvgPicture.asset("assets/icon/empty-clipboard.svg",),
            ),
            activeIcon: SizedBox(
              height: 25,
              child: SvgPicture.asset("assets/icon/empty-clipboard-1.svg",),
            ),
            label: "items",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 25,
              child: SvgPicture.asset("assets/icon/file-search-3.svg",),
            ),
            activeIcon: SizedBox(
              height: 25,
              child: SvgPicture.asset("assets/icon/file-search.svg",),
            ),
            label: "search",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 25,
              child: SvgPicture.asset("assets/icon/user-podcast-2.svg",),
            ),
            activeIcon: SizedBox(
              height: 25,
              child: SvgPicture.asset("assets/icon/user-podcast-3.svg",),
            ),
            label: "me",
          ),
        ],
      ),
    );
  }
}
