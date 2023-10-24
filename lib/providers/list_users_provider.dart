import 'package:flutter/material.dart';

import '../models/list_users_model.dart';
import '../services/list_users_service.dart';

class UserProvider extends ChangeNotifier {
  ListUsers? userList;

  Future<void> fetchUsers() async {
    try {
      final userService = UserService();
      final users = await userService.fetchUsers();
      userList = users;
      notifyListeners(); // Menginformasikan perubahan data ke widget yang mendengarkan provider ini.
    } catch (e) {
      // Handle error
      print('Error: $e');
    }
  }
}
