import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_skill_mobile_apps/controllers/user_controllers.dart';
import 'package:test_skill_mobile_apps/views/home_screen/views/home_screen.dart';

import 'providers/list_users_provider.dart';
import 'utils/firebase_options.dart';
import 'views/login_screen/views/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserLoginController.user != null ? HomeScreen() : LoginScreen(),
    );
  }
}
