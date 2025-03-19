import 'package:flutter/material.dart';
import 'package:recruitment/screen/notificationScreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.light_mode_outlined,
                        color: Colors.blue,
                        size: 40,
                      ),
                      const SizedBox(width: 2),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.pink[300],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),

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
                      padding: const EdgeInsets.all(12),
                      child: const Icon(
                        Icons.notifications_none,
                        size: 28,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.blue[50],
                      child: const CircleAvatar(
                        radius: 57,
                        backgroundImage: AssetImage('assets/avatar.png'),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Operator My',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    'interviewcaliana@gmail.com',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),

                  const SizedBox(height: 30),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        _buildMenuItem(
                          icon: Icons.person_outline,
                          title: 'Data Diri',
                          onTap: () {},
                        ),
                        const Divider(height: 1, thickness: 1, indent: 70),
                        _buildMenuItem(
                          icon: Icons.settings_outlined,
                          title: 'Pengaturan',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        _buildMenuItem(
                          icon: Icons.help_outline,
                          title: 'Bantuan',
                          onTap: () {},
                        ),
                        const Divider(height: 1, thickness: 1, indent: 70),
                        _buildMenuItem(
                          icon: Icons.logout,
                          title: 'Keluar',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey[600], size: 28),
            const SizedBox(width: 30),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue[400],
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Icon(Icons.chevron_right, color: Colors.blue[400]),
          ],
        ),
      ),
    );
  }
}
