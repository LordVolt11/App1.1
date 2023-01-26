// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

// import 'package:pollutionapp/Navigation_Pages/homePage/homePage.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:homepage/src/NavigationPages/homePage/UI/home_screen.dart';
import 'package:homepage/src/NavigationPages/homePage/homeUI.dart';

import 'DrawerPages/aboutPage.dart';
import 'DrawerPages/feedbackPage.dart';
import 'DrawerPages/helpPage.dart';
import 'DrawerPages/my_drawer_header.dart';
import 'DrawerPages/profilePage.dart';
import 'DrawerPages/settingsPage.dart';
import 'DrawerPages/termsPage.dart';
import 'NavigationPages/CalendarPage/calendarPage.dart';
import 'NavigationPages/ExposurePage/exposurePage.dart';
import 'NavigationPages/ResourcesPage/resourcesPage.dart';
import 'NavigationPages/RoutingPage/routingPage.dart';

class layoutPage extends StatefulWidget {
  const layoutPage({Key? key}) : super(key: key);

  @override
  State<layoutPage> createState() => _layoutPageState();
}

class _layoutPageState extends State<layoutPage> {
  int _selectedIndex = 0;
  String title = '';

  final List<Widget> _navScreens = [
    // homeUI(),
    HomeScreen(),
    mapPage(),
    calendarPage(),
    resourcesPage(),
    exposurePage(),
  ];
  List<String> titles = ['Home', 'Route', 'Calendar', 'Resources', 'Exposure'];

  var currentPage = DrawerSections.manageProfile;
  // var currentPageNavigator = _navScreens.elementAt(_selectedIndex);

  final List<Widget> _children = [];
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.manageProfile) {
      container = profilePage();
    } else if (currentPage == DrawerSections.settings) {
      container = settingsPage();
    } else if (currentPage == DrawerSections.help) {
      container = helpPage();
    } else if (currentPage == DrawerSections.about) {
      container = aboutPage();
    } else if (currentPage == DrawerSections.terms_and_policy) {
      container = termsPage();
    } else if (currentPage == DrawerSections.feedback) {
      container = feedbackPage();
    }

    return Scaffold(
      // Top App Bar
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('${title}'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                myDrawerList(),
                // ListTile(),
              ],
            ),
          ),
        ),
      ),
      body: _navScreens[_selectedIndex],

      // body: Center(
      //   child: _navScreens.elementAt(_selectedIndex),
      // ),

      // Bottom Navigation Bar

      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            padding: const EdgeInsets.all(16),
            gap: 5,
            tabs: const [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.map, text: 'Route'),
              GButton(icon: Icons.calendar_today, text: 'Calendar'),
              GButton(icon: Icons.assignment, text: 'Resources'),
              GButton(icon: Icons.gas_meter, text: 'Exposure'),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (int index) {
              setState(
                () {
                  _selectedIndex = index;
                  title = titles[index];
                },
              );
            },
          ),
        ),
      ),

      // Menu Draw
    );
  }

  Widget myDrawerList() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        //Shows the list of menu drawer
        children: [
          menuItem(1, "Profile", Icons.account_circle,
              currentPage == DrawerSections.manageProfile ? true : false),
          // Divider(),
          menuItem(2, "Settings", Icons.settings,
              currentPage == DrawerSections.settings ? true : false),
          // Divider(),
          menuItem(3, "Help", Icons.help,
              currentPage == DrawerSections.help ? true : false),
          // Divider(),
          menuItem(4, "About", Icons.info,
              currentPage == DrawerSections.about ? true : false),
          // Divider(),
          menuItem(5, "Terms & Conditions", Icons.policy,
              currentPage == DrawerSections.terms_and_policy ? true : false),
          // Divider(),
          menuItem(6, "Feedback", Icons.feedback,
              currentPage == DrawerSections.feedback ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[400] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.manageProfile;
              // _selectedIndex = 0;
            } else if (id == 2) {
              currentPage = DrawerSections.settings;
              // _selectedIndex = 1;
            } else if (id == 3) {
              currentPage = DrawerSections.help;
              // _selectedIndex = 2;
            } else if (id == 4) {
              currentPage = DrawerSections.about;
              // _selectedIndex = 3;
            } else if (id == 5) {
              currentPage = DrawerSections.terms_and_policy;
              // _selectedIndex = 4;
            } else if (id == 6) {
              currentPage = DrawerSections.feedback;
              // _selectedIndex = 5;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 5,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  manageProfile,
  settings,
  help,
  about,
  terms_and_policy,
  feedback,
}
