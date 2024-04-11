// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shpp/models/service.dart';
import 'package:shpp/services/database_service.dart';
import 'package:shpp/shared/router.dart';

class ServiceList extends StatefulWidget {
  const ServiceList({super.key});

  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  final DatabaseService _db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder<List<Service>>(
            stream: _db.getAllServices(),
            builder: (context, snapshot) {
              if (snapshot.hasError) return Text('Error: ${snapshot.error}');
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final projects = snapshot.data!;

              return ListView.builder(
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  final project = projects[index];
                  return ListTile(
                    // Implement onTap or trailing buttons for edit and delete functionalities.
                    onTap: () => router.goNamed(
                        AppRouteNames.adminServices.name,
                        queryParameters: {'id': project.uid}),
                    title: Text(project.title),
                    subtitle: Text(project.subtitle),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
