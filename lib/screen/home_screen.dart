import 'package:flutter/material.dart';
import 'package:quiz_mobile/screen/pyramid_screen.dart';
import 'package:quiz_mobile/screen/time_screen.dart';
import 'package:quiz_mobile/screen/check_day_screen.dart';
import 'package:quiz_mobile/screen/profile_screen.dart'; 

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; 

  final List<Widget> _widgetOptions = <Widget>[
    HomePage(), 
    ProfileScreen(), 
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Mobile'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped, 
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50], 
      body: Center( 
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              Text(
                'Selamat datang di Aplikasi Ku!',
                style: TextStyle(
                  fontSize: 28, 
                  fontWeight: FontWeight.bold,
                  color: Colors.purple[800], 
                  fontFamily: 'Roboto', 
                  letterSpacing: 1.2, 
                ),
                textAlign: TextAlign.center, 
              ),
              const SizedBox(height: 40), 
              _buildMenuButton(context, 'Menu Piramida', Icons.change_circle, PyramidScreen()),
              const SizedBox(height: 20),
              _buildMenuButton(context, 'Konversi Waktu', Icons.access_time, TimeConversionScreen()),
              const SizedBox(height: 20),
              _buildMenuButton(context, 'Cek Hari', Icons.calendar_today, CheckDayScreen()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, IconData icon, Widget screen) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      icon: Icon(icon, size: 30, color: Colors.white), 
      label: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), 
        ),
        elevation: 5,
      ),
    );
  }
}
