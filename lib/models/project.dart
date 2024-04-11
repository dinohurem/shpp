class Project {
  String uid;
  String title;
  String subtitle;
  String content;
  List<String> urls;

  Project(
      {required this.uid,
      required this.title,
      required this.subtitle,
      required this.content,
      required this.urls});

  factory Project.fromMap(Map data) {
    return Project(
      uid: data['uid'],
      title: data['title'],
      subtitle: data['subtitle'],
      content: data['content'],
      urls: List<String>.from(data['urls']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'title': title,
      'subtitle': subtitle,
      'content': content,
      'urls': urls,
    };
  }
}
