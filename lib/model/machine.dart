import 'package:cloud_firestore/cloud_firestore.dart';

class Machine {
  late String id, userId;
  late bool isActive;
  late DateTime date;

  Machine() {
    id = "";
    userId = "";
    isActive = true;
    date = DateTime.now();
  }

  Machine.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    userId = map["userId"];
    isActive = map["isActive"];
    date = (map["date"] as Timestamp).toDate();
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "userId": userId,
      "isActive": isActive,
      "date": date,
    };
  }
}
