import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/list_users_provider.dart';
import 'views/list_view_screen/views/list_users_screen.dart';


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
      home: UserList(),
    );
  }
}


