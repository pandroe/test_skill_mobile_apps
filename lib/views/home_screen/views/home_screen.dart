import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_skill_mobile_apps/controllers/user_controllers.dart';
import 'package:test_skill_mobile_apps/views/image_picker_screen/views/image_picker_screen.dart';
import 'package:test_skill_mobile_apps/views/login_screen/views/login_screen.dart';

import '../../../providers/list_users_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    // Panggil fetchUsers saat widget dibuat
    userProvider.fetchUsers();

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                title: Text(UserLoginController.user!.displayName ?? ''),
                background:
                    Image.network(UserLoginController.user!.photoURL ?? '')),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ImagePickerScreen()));
                  },
                  icon: Icon(Icons.image)),
              ElevatedButton(
                style: ButtonStyle(elevation: MaterialStatePropertyAll(0)),
                onPressed: () async {
                  await UserLoginController.signOut();
                  if (mounted) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
                  }
                },
                child: Text('Logout'),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final user = userProvider.userList!.data[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar),
                  ),
                  title: Text('${user.firstName} ${user.lastName}'),
                  subtitle: Text(user.email),
                );
              },
              childCount: userProvider.userList?.data.length ?? 0,
            ),
          ),
        ],
      ),
    );
  }
}
