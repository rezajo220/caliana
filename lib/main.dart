import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:recruitment/screen/dashboardScreen.dart';
import 'package:recruitment/screen/profileScreen.dart';
import 'package:recruitment/screen/registrasiScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visitor Management App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF00A8E8),
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool isDialOpen = false;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const Text('Page 2'),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen) {
          setState(() {
            isDialOpen = false;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: SafeArea(child: _screens[_selectedIndex]),
        floatingActionButton: SpeedDial(
          icon: Icons.add,
          activeIcon: Icons.add,
          backgroundColor: Colors.white,
          foregroundColor: Colors.grey[600],
          elevation: 4.0,
          shape: const CircleBorder(),
          overlayColor: Colors.white,
          overlayOpacity: 0.5,
          spacing: 15,
          spaceBetweenChildren: 15,
          onOpen: () {
            setState(() {
              isDialOpen = true;
            });
          },
          onClose: () {
            setState(() {
              isDialOpen = false;
            });
          },
          children: [
            SpeedDialChild(
              child: const Icon(Icons.add_chart),
              backgroundColor: Colors.blue[50],
              foregroundColor: Colors.blue,
              shape: const CircleBorder(),
              labelWidget: Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Text(
                  'Pra Registrasi',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              onTap: () {
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.description_outlined),
              backgroundColor: Colors.blue[50],
              foregroundColor: Colors.blue,
              shape: const CircleBorder(),
              labelWidget: Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Text(
                  'Registrasi',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegistrationForm(),
                  ),
                );
              },
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          notchMargin: 8.0,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: IconButton(
                  icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.home_outlined,
                        color:
                            _selectedIndex == 0
                                ? const Color(0xFF00A8E8)
                                : Colors.grey,
                      ),
                      Text(
                        "Beranda",
                        style: TextStyle(
                          fontSize: 11,
                          color:
                              _selectedIndex == 0
                                  ? const Color(0xFF00A8E8)
                                  : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () => _onItemTapped(0),
                ),
              ),
              const Spacer(),
              Expanded(
                child: IconButton(
                  icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.person_outline,
                        color:
                            _selectedIndex == 2
                                ? const Color(0xFF00A8E8)
                                : Colors.grey,
                      ),
                      Text(
                        "Profil",
                        style: TextStyle(
                          fontSize: 11,
                          color:
                              _selectedIndex == 2
                                  ? const Color(0xFF00A8E8)
                                  : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () => _onItemTapped(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
