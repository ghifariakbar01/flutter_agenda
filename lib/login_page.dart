// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login/home_page.dart';
import 'package:login/provider/all_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final email = TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        } else if (!value.contains('@')) {
          return 'Please enter a valid email';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      controller: passwordController,
      autofocus: false,
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter password';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final autoFill = FlatButton(
        child: Text(
          'Auto Fill',
          style: TextStyle(color: Colors.black54),
        ),
        onPressed: () {
          emailController.text = 'candidate@deptechdigital.com';
          passwordController.text = 'testInterview123!';
        });

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async {
          if (formKey.currentState?.validate() == false) return;
          final res = await ref
              .read(fireAuthProvider.notifier)
              .signIn(emailController.text, passwordController.text);
          if (res) {
            print('res is true');
            await ref
                .read(fireStoreProvider.notifier)
                .getUserById('users', 'fvcZjC3UL5M2T2WkbOdg');

            Navigator.of(context).pushNamed(HomePage.tag);
          }
          print('res is $res');
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 48.0),
              email,
              SizedBox(height: 8.0),
              password,
              SizedBox(height: 8.0),
              autoFill,
              loginButton,
            ],
          ),
        ),
      ),
    );
  }
}
