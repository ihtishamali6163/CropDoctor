import 'dart:io'; // Needed for exit(0)
import 'package:flutter/services.dart'; // Needed for SystemNavigator.pop
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:crop_doctor/home/news/news.dart';
import 'package:crop_doctor/home/profile/profile_screen.dart';
import 'package:crop_doctor/home/scan_plant.dart';
import 'package:crop_doctor/home/species/plants_lists.dart';
import 'package:crop_doctor/home/weather/weather.dart';
import 'articles/articles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    WeatherScreen(),
    PlantDiseaseScreen(),
    PlantTipsScreen(),
    NewsScreen(),
    // AllPlantsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<bool> _onWillPop() async {
    // You can choose either of these:
    // SystemNavigator.pop();  // Recommended for Android
    exit(0);  // Works for both but abrupt (use with caution)
    return false; // Don't pop the route; we're exiting the app
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            boxShadow: [
              BoxShadow(
                color: Colors.blue,
                blurRadius: 25,
                offset: Offset(0, -2),
              ),
            ],
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              selectedItemColor: Colors.green,
              unselectedItemColor: Color(0xFF4FC3F7),
              selectedLabelStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
              unselectedLabelStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 11,
              ),
              type: BottomNavigationBarType.shifting,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.cloudy_snowing),
                  label: 'Weather'
                  ,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.camera_alt_outlined),
                  label: 'Diagnose',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.lightbulb_outline),
                  label: 'Tips',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper_outlined),
                  label: 'News',
                ),
                // BottomNavigationBarItem(
                //   icon: Icon(Icons.person_outline),
                //   label: 'Species',
                // ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
