import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/list_users_model.dart';

class UserService {
  Future<ListUsers> fetchUsers() async {
    final response1 = await http.get(Uri.parse('https://reqres.in/api/users?page=1'));
    final response2 = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

    if (response1.statusCode == 200 && response2.statusCode == 200) {
      final data1 = json.decode(response1.body);
      final data2 = json.decode(response2.body);

      final userList = ListUsers.fromJson(data1);
      userList.data.addAll(Datum.listFromJson(data2['data']));

      return userList;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
