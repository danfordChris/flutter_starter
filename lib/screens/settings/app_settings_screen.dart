import 'package:changisha/constants/app_colors.dart';
import 'package:changisha/constants/app_pictures.dart';
import 'package:changisha/constants/app_text_style.dart';
import 'package:changisha/screens/settings/notification_screen.dart';
import 'package:changisha/services/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:hero_animation/hero_animation.dart';
import 'package:changisha/screens/settings/account_screen.dart';
import 'package:changisha/screens/settings/privacy_screen.dart';
import 'package:changisha/screens/settings/about_screen.dart';
import 'package:hugeicons/hugeicons.dart';

class AppSettingsScreen extends StatelessWidget {
  const AppSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Hero(
              tag: 'user-avatar',
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(AppPictures.avator),
              ),
              transitionOnUserGestures: true,
            ),
          ),
          const SizedBox(height: 24),
          _buildSettingItem(
            context,
            icon: Icons.person,
            title: 'Account',
            subtitle: 'Manage your account settings',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AccountScreen()),
              );
            },
          ),
          _buildSettingItem(
            context,
            icon: Icons.notifications,
            title: 'Notifications',
            subtitle: 'Customize notifications',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NotificationsScreen()),
              );
            },
          ),
          _buildSettingItem(
            context,
            icon: Icons.lock,
            title: 'Privacy',
            subtitle: 'Privacy preferences',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PrivacyScreen()),
              );
            },
          ),
          _buildSettingItem(
            context,
            icon: Icons.info,
            title: 'About',
            subtitle: 'App version and info',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AboutScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    final _isDarkMode = SessionManager.instance.isDarkMode;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: ListTile(
        leading: Icon(
          icon,
          color: _isDarkMode ? AppColors.grey : AppColors.blackText,
        ),
        title: Text(
          title,
          style: AppTextStyle.subtext4(
            _isDarkMode ? AppColors.black : AppColors.blackText,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyle.subtext1(
            _isDarkMode ? AppColors.white : AppColors.blackText,
          ),
        ),
        trailing: HugeIcon(
          icon: HugeIcons.strokeRoundedArrowRight01,
          color: _isDarkMode ? AppColors.white : AppColors.blackText,
        ),
        onTap: onTap,
      ),
    );
  }
}
