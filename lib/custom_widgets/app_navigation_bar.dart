import 'package:flutter/material.dart';
import 'package:kahanify_app/custom_widgets/bottom_navigation_bar.dart';
import 'package:kahanify_app/screens/all_library.dart';
import 'package:kahanify_app/screens/history.dart';
import 'package:kahanify_app/screens/membership.dart';
import 'package:kahanify_app/screens/profile.dart';


class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    AllLibrary(),
    Membership(),
    History(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
  }

