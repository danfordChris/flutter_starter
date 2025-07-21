import 'package:changisha/constants/app_pictures.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Hero(
                    tag: 'user-avatar',
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(AppPictures.avator),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => FullProfilePictureScreen()));
                    },
                    child: const Text('Change Profile Picture'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Account Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildAccountItem(
              context,
              icon: Icons.email,
              title: 'Email Address',
              subtitle: 'user@example.com',
              onTap: () {
                // implement navigation to edit screen or show dialog
              },
            ),
            _buildAccountItem(
              context,
              icon: Icons.phone,
              title: 'Phone Number',
              subtitle: '+255 712 345 678',
              onTap: () {
                // implement navigation to edit screen or show dialog
              },
            ),
            _buildAccountItem(
              context,
              icon: Icons.lock_outline,
              title: 'Change Password',
              subtitle: 'Update your password',
              onTap: () {
                // implement navigation to edit screen or show dialog
              },
            ),
            _buildAccountItem(
              context,
              icon: Icons.person_outline,
              title: 'Username',
              subtitle: 'current_username',
              onTap: () {
                // implement username change logic
              },
            ),
            _buildAccountItem(
              context,
              icon: Icons.logout,
              title: 'Log Out',
              subtitle: 'Sign out of your account',
              onTap: () {
                // implement navigation to edit screen or show dialog
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
