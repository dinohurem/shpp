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
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
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
              icon: const Icon(Icons.logout, size: 20),
              label: const Text("Logout"),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
