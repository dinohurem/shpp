class Service {
  String uid;
  String title;
  String subtitle;
  String content;

  Service({
    required this.uid,
    required this.title,
    required this.subtitle,
    required this.content,
  });

  factory Service.fromMap(Map data) {
    return Service(
      uid: data['uid'],
      title: data['title'],
      subtitle: data['subtitle'],
      content: data['content'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'title': title,
      'subtitle': subtitle,
      'content': content,
    };
  }
}
