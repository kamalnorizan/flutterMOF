import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertutorial/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.text = 'demo@gmail.com';
    passwordController.text = 'zLALJdqq';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email Address',
                  ),
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      _login(context);
                    },
                    child: const Text('Login'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login(context) async {
    var data = {
      'email': emailController.text,
      'password': passwordController.text
    };

    var response = await Callapi().postLogin(data);
    var body = json.decode(response.body);
    // print(body['success'].length);
    try {
      if (body['success'].length > 0) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', body['success']['token']);
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      print('not success');
    }
    // if (body['success'].length > 0) {
    //   print('success');
    // } else {
    //   print('not success');
    // }
  }
}
