import 'package:changisha/constants/app_colors.dart';
import 'package:changisha/constants/app_pictures.dart';
import 'package:changisha/constants/app_text_style.dart';
import 'package:changisha/screens/settings/notification_screen.dart';
import 'package:changisha/services/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
      body: Animate(
        effects: [
          FadeEffect(duration: 400.ms, curve: Curves.easeOut),
          SlideEffect(
            begin: const Offset(0, -0.1),
            end: Offset.zero,
            duration: 500.ms,
            curve: Curves.easeOutQuad,
          ),
        ],
        child: ListView(
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
            Column(
              children: [
                _buildSettingItem(
                  context,
                  icon: Icons.person,
                  index: 0,
                  title: 'Account',
                  subtitle: 'Manage your account settings',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => AccountScreen()),
                    );
                  },
                ),
                _buildSettingItem(
                  context,
                  icon: Icons.notifications,
                  index: 1,
                  title: 'Notifications',
                  subtitle: 'Customize notifications',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const NotificationsScreen(),
                      ),
                    );
                  },
                ),
                _buildSettingItem(
                  context,
                  icon: Icons.lock,
                  index: 2,
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
                  index: 3,
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
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(
    BuildContext context, {
    required IconData icon,
    required int index,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    final _isDarkMode = SessionManager.instance.isDarkMode;
    final delay = 200 + (index * 100);
    return Animate(
      effects: [
        FadeEffect(delay: delay.ms, duration: 400.ms),
        SlideEffect(
          begin: const Offset(-0.1, 0),
          end: Offset.zero,
          delay: delay.ms,
          duration: 400.ms,
          curve: Curves.easeOutQuad,
        ),
      ],
      child: Card(
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
      ),
    );
  }
}
