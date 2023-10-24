import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/list_users_provider.dart';
import 'views/image_picker_screen/views/image_picker_screen.dart';

void main() {
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
      home: ImagePickerScreen(),
    );
  }
}
