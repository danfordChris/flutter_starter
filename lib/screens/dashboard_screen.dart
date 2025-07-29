import 'package:changisha/constants/app_colors.dart';
import 'package:changisha/constants/app_text_style.dart';
import 'package:changisha/constants/app_pictures.dart';
import 'package:changisha/provider/settings_provider.dart';
import 'package:changisha/screens/home_screen/home_screen.dart';
import 'package:changisha/screens/settings/app_settings_screen.dart';
import 'package:changisha/services/localization_service.dart';
import 'package:changisha/services/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  late bool _isDarkMode;
  late SettingProvider _settingProvider;

  final List<Widget> _screens = [
    HomeScreen(),
    Center(child: Text('Notifications')),
    AppSettingsScreen(),
  ];
  @override
  void initState() {
    super.initState();
    _settingProvider = SettingProvider.of(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _settingProvider.init();
      setState(() {
        _isDarkMode = _settingProvider.themeMode == ThemeMode.dark;
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.white,
        title: _currentIndex == 0
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(AppPictures.avator),
                    radius: 20,
                  ),
                  SizedBox(width: 12),
                  // Image.asset(AppPictures.avator, height: 30),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Strings.instance.hiMessage('User Name'),
                        style: AppTextStyle.subtext5(AppColors.black),
                      ),
                      Text(
                        Strings.instance.welcomeMessage,
                        style: AppTextStyle.subtext4(AppColors.black),
                      ),
                    ],
                  ),
                ],
              )
            : null,
        actions: _currentIndex != 2
            ? [
                IconButton(
                  icon: HugeIcon(
                    icon: HugeIcons.strokeRoundedNotification03,
                    color: AppColors.black,
                  ),
                  onPressed: () {
                    // TODO: Implement notification action
                  },
                ),
              ]
            : [
                IconButton(
                  icon: HugeIcon(
                    icon: _isDarkMode == true
                        ? HugeIcons.strokeRoundedSun02
                        : HugeIcons.strokeRoundedMoon02,
                    color: _isDarkMode == true
                        ? AppColors.orange
                        : AppColors.black,
                  ),
                  onPressed: () async {
                    await _settingProvider.changeThemeMode();
                    await SessionManager.instance.changeTheme();
                    setState(() {
                      _isDarkMode =
                          _settingProvider.themeMode == ThemeMode.dark;
                    });
                  },
                ),
              ],
        centerTitle: false,
        titleSpacing: 16.0,
      ),

      body: _screens[_currentIndex],
      drawer: _currentIndex != 0
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(color: AppColors.black),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(AppPictures.avator),
                          radius: 30,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'User Name',
                          style: AppTextStyle.subtext5(AppColors.white),
                        ),
                        Text(
                          'user@example.com',
                          style: AppTextStyle.subtext4(AppColors.white),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                    onTap: () {
                      Navigator.pop(context);
                      _onItemTapped(0);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text('Notifications'),
                    onTap: () {
                      Navigator.pop(context);
                      _onItemTapped(1);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () {
                      Navigator.pop(context);
                      _onItemTapped(2);
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
                    onTap: () {
                      // TODO: Implement logout logic
                    },
                  ),
                ],
              ),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedHome02,
              color: AppColors.blackText,
            ),
            activeIcon: HugeIcon(
              icon: HugeIcons.strokeRoundedHome02,
              color: AppColors.primary,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedTimeQuarter02,
              color: AppColors.blackText,
            ),
            activeIcon: HugeIcon(
              icon: HugeIcons.strokeRoundedTimeQuarter02,
              color: AppColors.primary,
            ),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedSettings01,
              color: AppColors.blackText,
            ),
            activeIcon: HugeIcon(
              icon: HugeIcons.strokeRoundedSettings01,
              color: AppColors.primary,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
