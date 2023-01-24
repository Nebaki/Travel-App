import 'package:flutter/material.dart';
import 'package:travelapp/pages/navigate_pages/bar_item.page.dart';
import 'package:travelapp/pages/navigate_pages/homePage.dart';
import 'package:travelapp/pages/navigate_pages/my_page.dart';
import 'package:travelapp/pages/navigate_pages/search_page.dart';

class Mainpage extends StatefulWidget {
  Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  List pages = [
    const HomePage(),
    const BarItemPage(),
    const SearchPage(),
    const Mypage()
  ];
  int currentIndex = 0;
  void ontap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
    body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
          currentIndex: currentIndex,
          onTap: ontap,
          backgroundColor:Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_sharp), label: "Bar"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "My")
          ]),
    );
  }
}
