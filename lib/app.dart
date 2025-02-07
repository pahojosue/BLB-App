import 'package:blb/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:blb/utils/theme/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: BLBAppTheme.lightTheme,
      darkTheme: BLBAppTheme.darkTheme,
      home: const OnboardingScreen(),
    );
  }
}
