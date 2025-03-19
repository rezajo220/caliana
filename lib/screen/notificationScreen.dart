import 'package:flutter/material.dart';
import 'dart:async';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        title: const Text(
          'Pemberitahuan',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _isLoading 
          ? _buildLoadingView() 
          : _buildNotificationList(),
    );
  }

  Widget _buildLoadingView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationList() {
    return ListView(
      children: [
        _buildDateHeader('19 Mar 2025'),
        _buildNotificationItem(
          title: 'Berhasil Check In',
          description: 'reza berhasil check in',
          time: 'Rabu, 19 Mar 2025 | 15:14 WIB',
          icon: Icons.person_outline,
        ),
        _buildNotificationItem(
          title: 'Berhasil Registrasi',
          description: 'reza berhasil registrasi',
          time: 'Rabu, 19 Mar 2025 | 15:14 WIB',
          icon: Icons.person_outline,
        ),
        _buildNotificationItem(
          title: 'Berhasil Registrasi',
          description: 'Test berhasil registrasi',
          time: 'Rabu, 19 Mar 2025 | 10:20 WIB',
          icon: Icons.person_outline,
        ),
        _buildNotificationItem(
          title: 'Berhasil Check In',
          description: 'Test berhasil check in',
          time: 'Rabu, 19 Mar 2025 | 10:20 WIB',
          icon: Icons.person_outline,
        ),
        _buildDateHeader('14 Mar 2025'),
        _buildNotificationItem(
          title: 'Berhasil Registrasi',
          description: 'Devd berhasil registrasi',
          time: 'Jumat, 14 Mar 2025 | 09:59 WIB',
          icon: Icons.person_outline,
        ),
        _buildNotificationItem(
          title: 'Berhasil Check In',
          description: 'Devd berhasil check in',
          time: 'Jumat, 14 Mar 2025 | 09:59 WIB',
          icon: Icons.person_outline,
        ),
        _buildNotificationItem(
          title: 'Berhasil Check In',
          description: 'Devd berhasil check in',
          time: 'Jumat, 14 Mar 2025 | 09:59 WIB',
          icon: Icons.person_outline,
        ),
        _buildNotificationItem(
          title: 'Berhasil Check In',
          description: 'Devd berhasil check in',
          time: 'Jumat, 14 Mar 2025 | 09:59 WIB',
          icon: Icons.person_outline,
        ),
      ],
    );
  }

  Widget _buildDateHeader(String date) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        date,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String description,
    required String time,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: Colors.blue,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}