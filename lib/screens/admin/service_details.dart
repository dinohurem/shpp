import 'package:flutter/material.dart';
import 'package:shpp/models/service.dart';
import 'package:shpp/services/database_service.dart';

class ServiceDetails extends StatefulWidget {
  final String serviceId;

  const ServiceDetails({super.key, required this.serviceId});
  @override
  _ServiceDetailsState createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  final DatabaseService db =
      DatabaseService(); // Assuming this can also handle services
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    subtitleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  void addService() {
    final service = Service(
      uid: DateTime.now()
          .millisecondsSinceEpoch
          .toString(), // Simple UID generation
      title: titleController.text,
      subtitle: subtitleController.text,
      content: contentController.text,
    );
    db.createService(service); // Assuming similar method for services
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        ElevatedButton(onPressed: addService, child: const Text('Add Service')),
      ],
    );
  }
}
