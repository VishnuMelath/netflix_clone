import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/homescreen.dart';
import 'package:netflix_clone/screens/new_hot.dart';
import 'package:netflix_clone/screens/profile.dart';
import 'package:netflix_clone/themes/themes.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List pages = [const HomeScreen(), const NewAndHotPage(), const Profile()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: bottomnavcolor,
        currentIndex: currentIndex,
      
      
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.image), label: 'New and Hot'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/profile.jpeg',
                width: 18,
              ),
              label: 'My Netflix')
        ],
      ),
    );
  }
}
