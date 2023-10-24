import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/list_users_provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    // Panggil fetchUsers saat widget dibuat
    userProvider.fetchUsers();

    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: userProvider.userList == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: userProvider.userList!.data.length,
              itemBuilder: (context, index) {
                final user = userProvider.userList!.data[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar),
                  ),
                  title: Text('${user.firstName} ${user.lastName}'),
                  subtitle: Text(user.email),
                );
              },
            ),
    );
  }
}
