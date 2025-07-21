import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool pushNotifications = true;
  bool smsAlerts = false;
  bool emailUpdates = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Notification Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SwitchListTile(
              title: const Text('Push Notifications'),
              subtitle: const Text('Receive push notifications'),
              value: pushNotifications,
              onChanged: (value) {
                setState(() {
                  pushNotifications = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('SMS Alerts'),
              subtitle: const Text('Receive SMS alerts for important updates'),
              value: smsAlerts,
              onChanged: (value) {
                setState(() {
                  smsAlerts = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Email Updates'),
              subtitle: const Text('Receive updates via email'),
              value: emailUpdates,
              onChanged: (value) {
                setState(() {
                  emailUpdates = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
