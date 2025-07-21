import 'package:changisha/provider/settings_provider.dart';
import 'package:changisha/screens/dashboard_screen.dart';
import 'package:changisha/services/database_manager.dart';
import 'package:changisha/services/localization_service.dart';
import 'package:changisha/services/session_manager.dart';
import 'package:changisha/utils/app_theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseManager.instance.init();
  SessionManager.instance.setup();
  runApp(const AppInit());
}

class AppInit extends StatelessWidget {
  const AppInit({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SettingProvider())],
      child: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SettingProvider _settingProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _settingProvider = SettingProvider.of(context);
    super.initState();
    _settingProvider.init();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingProvider>(
      builder: (context, settingProvider, _) {
        return MaterialApp(
          title: 'Flutter Demo',
          localizationsDelegates: Strings.localizationDelegates,
          supportedLocales: Strings.supportedLocales,
          themeMode: settingProvider.themeMode,
          theme: AppThemeMode.lightTheme,
          darkTheme: AppThemeMode.darkTheme,
          home: DashboardScreen(),
        );
      },
    );
  }
}
