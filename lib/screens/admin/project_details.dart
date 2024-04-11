// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shpp/models/project.dart';
import 'package:shpp/services/database_service.dart';

class ProjectDetails extends StatefulWidget {
  final String projectId;

  const ProjectDetails({super.key, required this.projectId});

  @override
  _ProjectDetailsState createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  final DatabaseService db = DatabaseService();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    subtitleController.dispose();
    contentController.dispose();
    imageUrlController.dispose();
    super.dispose();
  }

  void addProject() {
    final project = Project(
      uid: DateTime.now()
          .millisecondsSinceEpoch
          .toString(), // Simple UID generation
      title: titleController.text,
      subtitle: subtitleController.text,
      content: contentController.text,
      urls: [imageUrlController.text], // Assuming single URL for simplicity
    );
    db.createProject(project);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Project'),
      ),
      body: Column(
        children: [
          TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title')),
          TextField(
              controller: subtitleController,
              decoration: const InputDecoration(labelText: 'Subtitle')),
          TextField(
              controller: contentController,
              decoration: const InputDecoration(labelText: 'Content')),
          TextField(
              controller: imageUrlController,
              decoration: const InputDecoration(labelText: 'Image URL')),
          ElevatedButton(
              onPressed: addProject, child: const Text('Add Project')),
        ],
      ),
    );
  }
}
