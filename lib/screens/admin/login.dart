// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, library_private_types_in_public_api, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shpp/screens/admin/admin.dart';
import 'package:shpp/services/auth_service.dart';
import 'package:shpp/shared/size_config.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email, _password;

  Future<void> signIn() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        var user =
            await AuthService().signInWithEmailAndPassword(_email, _password);

        if (user == null) {
          throw Exception('Invalid credentials.');
        }
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const Admin(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      } catch (e) {
        print(e);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Invalid email or password.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // Check if already logged in.
    if (FirebaseAuth.instance.currentUser != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const Admin(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal! * 5,
          vertical: SizeConfig.safeBlockVertical! * 3,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.safeBlockVertical! * 5,
                width: SizeConfig.safeBlockHorizontal! * 10,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (input) {
                    if (input!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (input) => _email = input!,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical! * 5,
                width: SizeConfig.safeBlockHorizontal! * 10,
                child: TextFormField(
                  validator: (input) {
                    if (input!.length < 6) {
                      return 'Your password needs to be at least 6 characters';
                    }
                    return null;
                  },
                  onSaved: (input) => _password = input!,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical! * 2,
              ),
              Center(
                child: SizedBox(
                  width: SizeConfig.safeBlockHorizontal! * 10,
                  height: SizeConfig.safeBlockVertical! * 4,
                  child: ElevatedButton(
                    onPressed: signIn,
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockVertical! * 2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
