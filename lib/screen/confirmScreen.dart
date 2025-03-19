import 'dart:ui';

import 'package:flutter/material.dart';

class ConfirmationScreen extends StatefulWidget {
  final Map<String, dynamic> userData;

  const ConfirmationScreen({
    Key? key,
    required this.userData,
  }) : super(key: key);

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  bool _isDataPribadiExpanded = true;
  bool _isTujuanKunjunganExpanded = true;
  final TextEditingController _companionsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _companionsController.text = widget.userData['companions'] ?? '1';
  }

  @override
  void dispose() {
    _companionsController.dispose();
    super.dispose();
  }

  void _showCancelConfirmationDialog() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Semua data tidak akan disimpan.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Yakin ingin membatalkan?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(); 
                          Navigator.of(context).pop(); 
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.grey[300]!),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          'Ya, batalkan',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          'Tidak, kembali',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Konfirmasi Data',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black54, size: 22),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              _buildCollapsibleSection(
                title: 'Data Pribadi',
                isExpanded: _isDataPribadiExpanded,
                onTap: () {
                  setState(() {
                    _isDataPribadiExpanded = !_isDataPribadiExpanded;
                  });
                },
                children: [
                  const SizedBox(height: 30),
                  _buildInfoField(
                    label: 'Nama',
                    value: widget.userData['name'] ?? '',
                    icon: Icons.person_outline,
                  ),
                  const SizedBox(height: 30),
                  _buildInfoField(
                    label: 'Email',
                    value: widget.userData['email'] ?? '',
                    icon: Icons.alternate_email,
                  ),
                ],
              ),
              
              const SizedBox(height: 25),
              
              _buildCollapsibleSection(
                title: 'Tujuan Kunjungan',
                isExpanded: _isTujuanKunjunganExpanded,
                onTap: () {
                  setState(() {
                    _isTujuanKunjunganExpanded = !_isTujuanKunjunganExpanded;
                  });
                },
                children: [
                  const SizedBox(height: 30),
                  _buildInfoField(
                    label: 'Berapa banyak orang yang bersama Anda ?',
                    value: _companionsController.text,
                    icon: Icons.star_border,
                  ),
                ],
              ),
              
              const SizedBox(height: 50),
              
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    final finalData = Map<String, dynamic>.from(widget.userData);
                    finalData['companions'] = _companionsController.text;
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Check In berhasil!')),
                    );
                    
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00BCD4),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Check In',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              SizedBox(
                width: double.infinity,
                height: 55,
                child: OutlinedButton(
                  onPressed: _showCancelConfirmationDialog,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF00BCD4),
                    side: const BorderSide(color: Color(0xFF00BCD4)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Batal',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCollapsibleSection({
    required String title,
    required bool isExpanded,
    required VoidCallback onTap,
    required List<Widget> children,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF00BCD4),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                AnimatedRotation(
                  turns: isExpanded ? 0.5 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xFF00BCD4),
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: isExpanded ? null : 0,
          child: AnimatedOpacity(
            opacity: isExpanded ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: isExpanded ? 1.0 : 0.0,
                child: Column(children: children),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoField({
    required String label,
    required String value,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Icon(icon, color: Colors.black54, size: 24),
            const SizedBox(width: 15),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          height: 1,
          color: Colors.blue,
        ),
      ],
    );
  }
}