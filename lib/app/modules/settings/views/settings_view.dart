import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_constants.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left, color: Colors.white, size: 32),
                    onPressed: () => Get.back(),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Settings',
                    style: AppTextStyles.title.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/images/image (1).png', 
                height: 100,
              ),
            ),
          
            const SizedBox(height: 30),
            _buildSettingItem('Full Name', 'Tabish Bin Tahir'),
            _buildSettingItem('Business Name', 'Mind2Matter'),
            _buildSettingItem('Email', 'tabish@m2m.com'),
            _buildSettingItem('Phone Number', '+123456789611'),
            _buildSettingItem('Zip Code', '10001'),
            _buildSettingItem('Password', '*****'),
            _buildSettingItem('ID', 'Verified'),
            _buildSettingItem('NPI', ''),
            _buildSettingItem('Blocklist', ''),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(String title, String value) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: ListTile(
        title: Text(
          title,
          style: AppTextStyles.title.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: AppTextStyles.subtitle.copyWith(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
         SizedBox(
          width: 10,
         ),
            CircleAvatar(
              radius: 15,
              backgroundColor: Colors.black,
              child: const Icon(Icons.chevron_right, color: Colors.white)),
          ],
        ),
      ),
    );
  }
} 