// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shpp/models/project.dart';
import 'package:shpp/models/service.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Projects
  // Create a new project
  Future<void> createProject(Project project) async {
    await _db.collection('projects').doc(project.uid).set(project.toMap());
  }

  // Update an existing project
  Future<void> updateProject(Project project) async {
    await _db.collection('projects').doc(project.uid).update(project.toMap());
  }

  // Delete a project
  Future<void> deleteProject(String uid) async {
    await _db.collection('projects').doc(uid).delete();
  }

  // Fetch a project
  Future<Project?> getProject(String uid) async {
    DocumentSnapshot doc = await _db.collection('projects').doc(uid).get();
    return doc.exists
        ? Project.fromMap(doc.data() as Map<String, dynamic>)
        : null;
  }

  // Fetch all projects
  Stream<List<Project>>? getAllProjects() {
    try {
      return _db.collection('projects').snapshots().map((snapshot) {
        var data =
            snapshot.docs.map((doc) => Project.fromMap(doc.data())).toList();
        return data;
      });
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Services
  // Create a new service
  Future<void> createService(Service service) async {
    await _db.collection('services').doc(service.uid).set(service.toMap());
  }

  // Update an existing service
  Future<void> updateService(Service service) async {
    await _db.collection('services').doc(service.uid).update(service.toMap());
  }

  // Delete a service
  Future<void> deleteService(String uid) async {
    await _db.collection('services').doc(uid).delete();
  }

  // Fetch a service
  Future<Service?> getService(String uid) async {
    DocumentSnapshot doc = await _db.collection('services').doc(uid).get();
    return doc.exists
        ? Service.fromMap(doc.data() as Map<String, dynamic>)
        : null;
  }

  // Fetch all services
  Stream<List<Service>> getAllServices() {
    return _db.collection('services').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Service.fromMap(doc.data())).toList();
    });
  }
}
