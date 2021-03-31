import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'home_page.dart';

class TabPage extends StatefulWidget{
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage>{
  int _selecteIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Center(
      child: Text("Notifications"),
    ),
    HomePage(),
    Center(
      child: Text("Chat"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color : Color(0xff1cad43), boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(1))]),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                  child: GNav(
                      duration: Duration(milliseconds: 900), // tab animation duration
                      gap: 8, // the tab button gap between icon and text
                      color: Colors.white, // unselected icon color
                      activeColor: Colors.white, // selected icon and text color
                      iconSize: 24, // tab button icon size
                      tabBackgroundColor: Colors.white24, // selected tab background color
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5), // navigation bar padding
                      tabs: [
                        GButton(
                          icon: Icons.notifications,
                          text: 'Notifications',
                        ),
                        GButton(
                          icon: Icons.home,
                          text: 'Home',
                        ),
                        GButton(
                          icon: Icons.message,
                          text: 'Chat',
                        ),
                      ],
                    selectedIndex: _selecteIndex,
                    onTabChange: (index){
                      setState(() {
                        _selecteIndex = index;
                      });
                    },
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height /1.15,
              child: _widgetOptions.elementAt(_selecteIndex),
            ),
          ],
        ),
      ),
    );
  }
}