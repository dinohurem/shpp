class Project {
  String uid;
  String title;
  String subtitle;
  String content;
  List<String> urls;
  final int order;

  Project({
    required this.uid,
    required this.title,
    required this.subtitle,
    required this.content,
    required this.urls,
    this.order = 0,
  });

  factory Project.fromMap(Map data) {
    return Project(
      uid: data['uid'],
      title: data['title'],
      subtitle: data['subtitle'],
      content: data['content'],
      urls: List<String>.from(data['urls']),
      order: data['order'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'title': title,
      'subtitle': subtitle,
      'content': content,
      'urls': urls,
      'order': order,
    };
  }
}
