import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;

  List<Widget> pages = [
    Text("Page1"),
    Text("Page2"),
    Text("Page3"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
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
