import 'package:cloud_firestore/cloud_firestore.dart';

class Announcement {
  late String id, title, content;
  late DateTime date;

  Announcement() {
    id = "";
    title = "";
    content = "";
    date = DateTime.now();
  }

  Announcement.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    title = map["title"];
    content = map["content"];
    date = (map["date"] as Timestamp).toDate();
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "content": content,
      "date": date,
    };
  }
}
