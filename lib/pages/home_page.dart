import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagramui/pages/feed_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;

  final _pages = [
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Instagram",
              style: TextStyle(
                  color: Colors.white, fontSize: 36, fontFamily: 'Billabon'),
            ),
            const SizedBox(width: 10),
            SvgPicture.asset(
              width: 10,
              height: 10,
              "assets/images/ic_down.svg",
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.modulate,
              ),
            ),
          ],
        ),
        actions: [
          SvgPicture.asset(
            "assets/images/ic_liked.svg",
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.modulate,
            ),
          ),
          const SizedBox(width: 20),
          SvgPicture.asset(
            "assets/images/ic_message.svg",
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.modulate,
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: _pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (int index) {
          setState(() {
            _currentPage = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Feed",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Feed",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_rounded),
            label: "Feed",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Feed",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Feed",
          ),
        ],
      ),
    );
  }
}
