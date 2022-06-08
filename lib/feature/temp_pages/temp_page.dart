import 'package:flutter/material.dart';
import 'package:mock_data_example/product/widget/widget_item/my_avatar.dart';

import '../home/view/home_view.dart';
import 'test_pages.dart';

class TempPage extends StatefulWidget {
  const TempPage({Key? key}) : super(key: key);

  @override
  _TempPageState createState() => _TempPageState();
}

class _TempPageState extends State<TempPage> {
  int _selectedScreenIndex = 0;

  int _currentIndex = 0;

  final List _children = [HomePage(), TestA(), TestB(), TestC()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: myBottomNavigationBar(),
    );
  }

  BottomNavigationBar myBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: _currentIndex,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      onTap: onTabTapped,
      items: [
        BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/homepage.png",
              height: 25,
              color: _currentIndex == 0 ? Colors.pink : Colors.grey.shade600,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/search.png",
              height: 25,
              color: _currentIndex == 1 ? Colors.pink : Colors.grey.shade600,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/graphic.png",
              height: 25,
              color: _currentIndex == 2 ? Colors.pink : Colors.grey.shade600,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: MyAvatar(
              headerAvatar: true,
              bottomMenuAvatar: true,
              imageUrl:
                  'https://pbs.twimg.com/profile_images/1527007156289028096/xs3xTEXm_400x400.jpg',
            ),
            label: "")
      ],
    );
  }
}
