import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Privacy Settings',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              _buildPrivacyItem(
                context,
                icon: Icons.security,
                title: 'Data Encryption',
                subtitle: 'Ensure your data is securely encrypted',
                onTap: () {},
              ),
              _buildPrivacyItem(
                context,
                icon: Icons.visibility_off,
                title: 'Private Profile',
                subtitle: 'Hide your profile from public search',
                onTap: () {},
              ),
              _buildPrivacyItem(
                context,
                icon: Icons.shield,
                title: 'Two-Factor Authentication',
                subtitle: 'Add extra security to your account',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPrivacyItem(
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
