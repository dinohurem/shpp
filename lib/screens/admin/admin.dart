import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shpp/screens/admin/login.dart';
import 'package:shpp/screens/admin/project_list.dart';
import 'package:shpp/screens/admin/service_list.dart';
import 'package:shpp/screens/home.dart';
import 'package:shpp/services/auth_service.dart';
import 'package:shpp/shared/size_config.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();

    // If user not logged in, redirect him to login first.
    if (FirebaseAuth.instance.currentUser == null) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const Login(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      );
    }

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Admin'),
        centerTitle: true,
        actions: [
          Center(
            child: SizedBox(
              width: SizeConfig.safeBlockHorizontal! * 10,
              height: SizeConfig.safeBlockVertical! * 4,
              child: ElevatedButton(
                onPressed: () async {
                  var navigator = Navigator.of(context);
                  await AuthService().signOut();

                  if (!mounted) return;

                  navigator.pushReplacement(
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const Home(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
                child: Text(
                  'Log Out',
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
      body: TabBarView(
        controller: _tabController,
        children: const [
          ProjectList(), // Widget to handle projects
          ServiceList(), // Widget to handle services
        ],
      ),
    );
  }
}
