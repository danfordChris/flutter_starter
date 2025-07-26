import 'package:changisha/constants/app_colors.dart';
import 'package:changisha/constants/app_pictures.dart';
import 'package:changisha/constants/app_text_style.dart';
import 'package:changisha/screens/dashboard_screen.dart';
import 'package:changisha/screens/settings/account_edit_screen.dart';
import 'package:changisha/screens/settings/change_password_screen.dart';
import 'package:changisha/services/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hugeicons/hugeicons.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mock user data - replace with your actual data source
    final userData = {
      'email': 'user@example.com',
      'phone': '+255 712 345 678',
      'username': 'current_username',
    };

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile section with staggered animation
                Animate(
                  effects: [
                    FadeEffect(duration: 400.ms, curve: Curves.easeOut),
                    SlideEffect(
                      begin: const Offset(0, -0.1),
                      end: Offset.zero,
                      duration: 500.ms,
                      curve: Curves.easeOutQuad,
                    ),
                  ],
                  child: Center(
                    child: Column(
                      children: [
                        Hero(
                          tag: 'user-avatar',
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(AppPictures.avator),
                          ),
                          transitionOnUserGestures: true,
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => FullProfilePictureScreen()));
                          },
                          child: Animate(
                            effects: [
                              FadeEffect(duration: 500.ms),
                              ScaleEffect(
                                begin: const Offset(0.95, 0.95),
                                duration: 300.ms,
                                curve: Curves.easeOutBack,
                              ),
                            ],
                            child: const Text('Change Profile Picture'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Title with fade and slide animation
                Animate(
                  effects: [
                    FadeEffect(delay: 200.ms, duration: 400.ms),
                    SlideEffect(
                      begin: const Offset(-0.1, 0),
                      duration: 400.ms,
                      curve: Curves.easeOutQuad,
                    ),
                  ],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Account Settings',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          final updatedData = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AccountEditScreen(initialData: userData),
                            ),
                          );

                          // Handle the updated data if needed
                          if (updatedData != null) {
                            // Update your state management or database here
                            print('Updated data: $updatedData');
                          }
                        },
                        icon: HugeIcon(
                          icon: HugeIcons.strokeRoundedEdit04,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // List items with staggered animations
                Column(
                  children: [
                    _buildAccountItem(
                      context,
                      index: 0,
                      icon: Icons.email,
                      title: 'Email Address',
                      subtitle: userData['email']!,
                    ),
                    _buildAccountItem(
                      context,
                      index: 1,
                      icon: Icons.phone,
                      title: 'Phone Number',
                      subtitle: userData['phone']!,
                    ),
                    _buildAccountItem(
                      context,
                      index: 2,
                      icon: Icons.lock_outline,
                      title: 'Change Password',
                      subtitle: 'Update your password',
                      onTap: () {
                        // Navigate to password change screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangePasswordScreen(),
                          ),
                        );
                      },
                    ),
                    _buildAccountItem(
                      context,
                      index: 3,
                      icon: Icons.person_outline,
                      title: 'Username',
                      subtitle: userData['username']!,
                    ),
                    _buildAccountItem(
                      context,
                      index: 4,
                      icon: Icons.logout,
                      title: 'Log Out',
                      subtitle: 'Sign out of your account',
                      onTap: () {
                        // Handle logout
                        _showLogoutConfirmation(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAccountItem(
    BuildContext context, {
    required int index,
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: _isDarkMode
              ? Colors.grey.shade800.withOpacity(0.6)
              : Colors.grey.shade100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(icon, color: Theme.of(context).primaryColor),
              title: Text(
                title,
                style: AppTextStyle.subtext4(
                  _isDarkMode ? AppColors.white : AppColors.blackText,
                ),
              ),
              subtitle: Text(
                subtitle,
                style: AppTextStyle.subtext1(
                  _isDarkMode ? AppColors.grey8 : AppColors.blackSubtext,
                ),
              ),
              onTap: onTap,
              trailing: onTap != null
                  ? HugeIcon(
                      icon: HugeIcons.strokeRoundedArrowRight01,
                      color: _isDarkMode
                          ? AppColors.white
                          : AppColors.blackText,
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }

  // Add this new method to your AccountScreen class:
  void _showLogoutConfirmation(BuildContext context) {
    final _isDarkMode = SessionManager.instance.isDarkMode;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: _isDarkMode ? Colors.grey.shade800 : Colors.white,
        title: Text(
          'Log Out',
          style: AppTextStyle.subtext4(
            _isDarkMode ? AppColors.white : AppColors.blackText,
          ),
        ),
        content: Text(
          'Are you sure you want to log out?',
          style: AppTextStyle.subtext1(
            _isDarkMode ? AppColors.grey8 : AppColors.blackSubtext,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: AppTextStyle.subtext1(AppColors.primary),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              _performLogout(context);
            },
            child: Text('Log Out', style: AppTextStyle.subtext1(AppColors.red)),
          ),
        ],
      ),
    );
  }

  void _performLogout(BuildContext context) async {
    try {
      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      // // Call your logout service
      // await AuthService.logout();

      // Navigate to login screen and clear navigation stack
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } catch (e) {
      Navigator.pop(context); // Dismiss loading indicator
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Logout failed: ${e.toString()}')));
    }
  }
}
