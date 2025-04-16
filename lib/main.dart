import 'package:blb/data/repositories/authentication/authentication_repository.dart';
import 'package:blb/features/personalisation/controllers/user_controller.dart';
import 'package:blb/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';

//Entry point of FLutter App
Future<void> main() async {
  // Todo: Add Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // Todo: Init Local Storage
  await GetStorage.init();

  // Todo: Await Native Spash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Todo: Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  // Todo: Register UserController
  Get.put(UserController());

  //Load all the Material Design / Themes / Localizations / Bindings
  runApp(const App());
}
