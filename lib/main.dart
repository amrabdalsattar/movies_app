import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/data/api_manager/api_manager.dart';
import 'package:movies_app/ui/screens/home_screen.dart';
import 'package:movies_app/ui/screens/splash.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_theme.dart';
import 'package:movies_app/utils/settings_provider.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColor.transparent,
  ));
  runApp(ChangeNotifierProvider(
      create: (_) => SettingsProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {SplashScreen.routeName: (_) => const SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen()},
      initialRoute: SplashScreen.routeName,
      theme: AppTheme.appTheme,
      home: HomeScreen(),
    );
  }
}
