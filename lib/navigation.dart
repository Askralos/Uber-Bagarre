import 'package:flutter/material.dart';

import 'screen/fighter_screen.dart';
import 'screen/home_screen.dart';
import 'screen/profile_screen.dart';
import 'screen/recap_screen.dart';
import 'widget/navigation_bar.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Navigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    FighterScreen(),
    ProfileScreen(),
    RecapScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
      ),
    );
  }
}
