import 'package:flutter/material.dart';
import 'package:habit_tracker/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMesssage = '';
  bool isLogin = true;

  final TextEditingController _ControllerEmail = TextEditingController();
  final TextEditingController _ControllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _ControllerEmail.text,
        password: _ControllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMesssage = e.message;
      });
    }
  }

  Future<void> createWithEmailAndPassword() async {
    try {
      await Auth().createWithEmailAndPassword(
        email: _ControllerEmail.text,
        password: _ControllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMesssage = e.message;
      });
    }
  }

  Widget _title() {
    return Align(
      alignment: Alignment.topCenter,
      child: Text(
        isLogin ? 'Login' : 'Sign Up',
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMesssage == '' ? '' : 'Hummm ? $errorMesssage');
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed:
          isLogin ? signInWithEmailAndPassword : createWithEmailAndPassword,
      child: Text(isLogin ? 'Login' : 'Sign Up'),
    );
  }

  Widget _LoginOrRegister() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin ? 'register instead' : 'login instead'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _title(),
              _entryField('Email', _ControllerEmail),
              _entryField('Password', _ControllerPassword),
              _errorMessage(),
              _submitButton(),
              _LoginOrRegister()
            ],
          )),
    );
  }
}
