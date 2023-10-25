import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test_skill_mobile_apps/views/list_view_screen/views/list_users_screen.dart';

import '../../../controllers/user_controllers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset('assets/lotties/hello_lottie.json'),
          ),
          Text(
            'Selamat Datang Di Aplikasi',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Text(
            'Jangan khawatir untuk aplikasi ini dikarenakan aman dan terpercaya.',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 12.0,
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                final user = await UserLoginController.loginWithGoogle();
                if (user != null && mounted) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => UserList()));
                }
              } on FirebaseAuthException catch (e) {
                print(e.message);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.message ?? 'Terjadi Masalah')));
              } catch (e) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(e.toString())));
              }
            },
            child: Text('Login Google'),
          ),
        ],
      ),
    );
  }
}
