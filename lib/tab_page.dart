import 'package:flutter/material.dart';
import 'package:flutter_trial_app/account_page.dart';
import 'package:flutter_trial_app/home_page.dart';
import 'package:flutter_trial_app/search_page.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;

  List<Widget> pages = [
    HomePage(),
    SearchPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("Search")),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text("Account")),
        ],
      ),
    );
  }
}
