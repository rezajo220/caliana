import 'dart:async';
import 'package:flutter/material.dart';
import 'package:recruitment/screen/notificationScreen.dart';
import 'package:recruitment/screen/searchScreen.dart';
import 'package:recruitment/widget/featureButton.dart';
import 'package:recruitment/widget/featureIconButton.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late DateTime _currentTime;
  late Timer _timer;
  int _selectedFeatureIndex = 0;

  final List<String> _features = [
    'Semua Fitur',
    'Visitor Management S',
    'Access Control System',
  ];

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();

    // Update time every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel timer when widget is disposed
    super.dispose();
  }

  void _selectFeature(int index) {
    setState(() {
      _selectedFeatureIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> monthNames = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    final List<String> dayNames = [
      'Senin',
      'Selasa',
      'Rabu',
      'Kamis',
      'Jumat',
      'Sabtu',
      'Minggu',
    ];

    final String formattedDate =
        '${dayNames[_currentTime.weekday - 1]}, ${_currentTime.day} ${monthNames[_currentTime.month - 1]} ${_currentTime.year}';
    final String formattedTime =
        '${_currentTime.hour}:${_currentTime.minute.toString().padLeft(2, '0')}:${_currentTime.second.toString().padLeft(2, '0')} ${_currentTime.hour >= 12 ? 'PM' : 'AM'}';

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          color: Colors.grey[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/logo.webp', width: 40, height: 40),
                  const SizedBox(width: 4),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 5,
                          bottom: 5,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Operator',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.blue[50],
                        child: const CircleAvatar(
                          radius: 57,
                          backgroundImage: AssetImage('assets/person.jpg'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NotificationScreen(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Icon(
                            Icons.notifications_none,
                            size: 30,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        formattedDate,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        formattedTime,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.search, color: Colors.grey[400]),
                              const SizedBox(width: 8),
                              Text(
                                'Cari',
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Fitur',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 16),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              _features.length,
                              (index) => FeatureButton(
                                isSelected: _selectedFeatureIndex == index,
                                title: _features[index],
                                onTap: () => _selectFeature(index),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FeatureIconButton(
                              icon: Icons.add_chart,
                              title: 'Dasbor',
                              onTap: () {},
                            ),
                            FeatureIconButton(
                              icon: Icons.people_outline,
                              title: 'Daftar\nPengunjung',
                              onTap: () {},
                            ),
                            FeatureIconButton(
                              icon: Icons.home_outlined,
                              title: 'Residen',
                              onTap: () {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hari Ini',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 60),

                      Center(
                        child: Column(
                          children: [
                            Text(
                              'Belum Ada Pengunjung Baru',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Pengunjung yang menunggu akan ditampilkan di sini',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[500],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[100],
                                foregroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(color: Colors.blue[300]!),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 12,
                                ),
                              ),
                              child: const Text('Refresh'),
                            ),
                            const SizedBox(height: 100),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
