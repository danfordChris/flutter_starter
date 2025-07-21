import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About This App',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('App Name'),
              subtitle: const Text('Changisha'),
            ),
            ListTile(
              leading: const Icon(Icons.verified),
              title: const Text('Version'),
              subtitle: const Text('1.0.0'),
            ),
            ListTile(
              leading: const Icon(Icons.code),
              title: const Text('Developer'),
              subtitle: const Text('Danford Christopher'),
            ),
            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('Website'),
              subtitle: const Text('https://danford.vercel.app'),
              onTap: () {
                // You can add a launch URL function here if needed.
              },
            ),
          ],
        ),
      ),
    );
  }
}
