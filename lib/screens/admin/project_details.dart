import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shpp/models/project.dart';
import 'package:shpp/services/database_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProjectDetails extends StatefulWidget {
  final Project? project;
  const ProjectDetails({super.key, this.project});

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  final DatabaseService db = DatabaseService();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  List<String> imageUrls = [];
  bool isUploading = false;

  @override
  void initState() {
    super.initState();
    if (widget.project != null) {
      titleController.text = widget.project!.title;
      subtitleController.text = widget.project!.subtitle;
      contentController.text = widget.project!.content;
      imageUrls = List<String>.from(widget.project!.urls);
    }
  }

  Future<void> uploadImage() async {
    final Uint8List? bytes = await ImagePickerWeb.getImageAsBytes();
    if (bytes != null) {
      setState(() => isUploading = true);
      try {
        final String fileName =
            DateTime.now().millisecondsSinceEpoch.toString();
        final ref =
            FirebaseStorage.instance.ref().child('projects/$fileName.jpg');
        final uploadTask = await ref.putData(bytes);
        final imageUrl = ref.fullPath; // Save path only
        setState(() {
          imageUrls.add(imageUrl);
          isUploading = false;
        });
        Fluttertoast.showToast(msg: "Image uploaded successfully");
      } catch (e) {
        setState(() => isUploading = false);
        Fluttertoast.showToast(msg: "Image upload failed: $e");
      }
    }
  }

  void removeImage(String url) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Image"),
        content: const Text("Are you sure you want to delete this image?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text("Cancel")),
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text("Delete")),
        ],
      ),
    );

    if (confirm == true) {
      setState(() => imageUrls.remove(url));
      Fluttertoast.showToast(msg: "Image removed from project");
    }
  }

  void previewImage(String path) async {
    try {
      final downloadUrl =
          await FirebaseStorage.instance.ref(path).getDownloadURL();
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (context) => Dialog(
          child: Image.network(
            downloadUrl,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error_outline,
                        color: Colors.red, size: 48),
                    const SizedBox(height: 16),
                    Text('Failed to load image: ${error.toString()}'),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
    } catch (e) {
      Fluttertoast.showToast(msg: 'Failed to load preview: $e');
    }
  }

  Future<void> deleteProject() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Project"),
        content: const Text(
            "Are you sure you want to permanently delete this project?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text("Cancel")),
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text("Delete")),
        ],
      ),
    );

    if (confirm == true && widget.project != null) {
      await db.deleteProject(widget.project!.uid);
      Fluttertoast.showToast(msg: "Project deleted successfully");
      if (mounted) Navigator.of(context).pop();
    }
  }

  Future<void> saveProject() async {
    final title = titleController.text.trim();
    final subtitle = subtitleController.text.trim();
    final content = contentController.text.trim();

    if (title.isEmpty || subtitle.isEmpty || content.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please fill in all fields and add at least one image.");
      return;
    }

    final project = Project(
      uid: widget.project?.uid ??
          DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      subtitle: subtitle,
      content: content,
      urls: imageUrls,
      order: widget.project?.order ?? 0,
    );

    if (widget.project != null) {
      await db.updateProject(project);
      Fluttertoast.showToast(msg: "Project updated successfully");
    } else {
      await db.createProject(project);
      Fluttertoast.showToast(msg: "Project created successfully");
    }

    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);

    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.project != null ? 'Edit Project' : 'Add Project'),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(labelText: 'Title'),
                  ),
                  TextField(
                    controller: subtitleController,
                    decoration: const InputDecoration(labelText: 'Subtitle'),
                  ),
                  TextField(
                    controller: contentController,
                    decoration: const InputDecoration(labelText: 'Content'),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Images', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ...imageUrls.map((path) => GestureDetector(
                      onTap: () => previewImage(path),
                      child: FutureBuilder<String>(
                        future:
                            FirebaseStorage.instance.ref(path).getDownloadURL(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const SizedBox(
                              width: 120,
                              height: 120,
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }
                          if (snapshot.hasError || !snapshot.hasData) {
                            return Container(
                              width: 120,
                              height: 120,
                              color: Colors.grey[300],
                              child: const Icon(Icons.broken_image,
                                  color: Colors.red),
                            );
                          }
                          return Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Image.network(
                                snapshot.data!,
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Container(
                                    width: 120,
                                    height: 120,
                                    color: Colors.grey[200],
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: 120,
                                    height: 120,
                                    color: Colors.grey[300],
                                    child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.broken_image,
                                            color: Colors.red),
                                        SizedBox(height: 4),
                                        Text('Failed to load',
                                            style: TextStyle(fontSize: 10)),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.close, color: Colors.red),
                                onPressed: () => removeImage(path),
                              ),
                            ],
                          );
                        },
                      ),
                    )),
                GestureDetector(
                  onTap: uploadImage,
                  child: Container(
                    width: 120,
                    height: 120,
                    color: Colors.grey[300],
                    child: isUploading
                        ? const Padding(
                            padding: EdgeInsets.all(24.0),
                            child: CircularProgressIndicator(),
                          )
                        : const Center(child: Icon(Icons.add_a_photo)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: saveProject,
                  icon: const Icon(Icons.save),
                  label: const Text('Save Project'),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16)),
                ),
                const SizedBox(width: 16),
                if (widget.project != null)
                  ElevatedButton.icon(
                    onPressed: deleteProject,
                    icon: const Icon(
                      Icons.delete_forever,
                      color: Colors.white,
                    ),
                    label: const Text('Delete Project',
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
