import 'package:blb/bindings/general_bindings.dart';
import 'package:blb/utils/constants/colors.dart';
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
      initialBinding: GeneralBindings(),
      //Show Loader
      home: const Scaffold(
          backgroundColor: BLBColors.primary,
          body: Center(child: CircularProgressIndicator(color: Colors.white))),
    );
  }
}
