import 'package:flutter/material.dart';
import 'package:shpp/models/project.dart';
import 'package:shpp/services/database_service.dart';
import 'package:shpp/screens/admin/project_details.dart';
import 'package:shpp/shared/size_config.dart';

class ProjectList extends StatefulWidget {
  const ProjectList({super.key});

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  final DatabaseService _db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 16,
        title: Row(
          children: [
            const Text('Projects'),
            const SizedBox(width: 16),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const ProjectDetails(),
                ));
              },
              icon: const Icon(Icons.add),
              label: const Text("Add Project"),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder<List<Project>>(
        stream: _db.getAllProjects(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return const Text('Error: \${snapshot.error}');
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final projects = snapshot.data!;
          if (projects.isEmpty) {
            return const Center(child: Text('No projects available.'));
          }

          return SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 50,
            child: ReorderableListView.builder(
              buildDefaultDragHandles: false,
              itemCount: projects.length,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemBuilder: (context, index) {
                final project = projects[index];
                return Card(
                  key: ValueKey(project.uid),
                  child: ListTile(
                    title: Text(project.title),
                    subtitle: Text(project.subtitle),
                    leading: ReorderableDragStartListener(
                      index: index,
                      child: const Icon(Icons.drag_handle),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => ProjectDetails(project: project),
                        ));
                      },
                    ),
                  ),
                );
              },
              onReorder: (oldIndex, newIndex) async {
                if (newIndex > oldIndex) newIndex -= 1;

                final reordered = [...projects];
                final item = reordered.removeAt(oldIndex);
                reordered.insert(newIndex, item);

                for (int i = 0; i < reordered.length; i++) {
                  await _db.updateProjectOrder(reordered[i].uid, i);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
