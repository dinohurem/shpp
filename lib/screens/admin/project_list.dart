import 'package:flutter/material.dart';
import 'package:shpp/models/project.dart';
import 'package:shpp/services/database_service.dart';
import 'package:shpp/shared/router.dart';

class ProjectList extends StatefulWidget {
  const ProjectList({super.key});

  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  final DatabaseService _db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder<List<Project>>(
            stream: _db.getAllProjects(),
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
                        AppRouteNames.adminProjects.name,
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
