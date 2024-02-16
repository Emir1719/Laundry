import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laundry/constant/enums/machine_enum.dart';

class Machine {
  late String id, userId;
  late bool isActive;
  late DateTime date;
  late MachineType type;

  Machine() {
    id = "";
    userId = "";
    isActive = true;
    date = DateTime.now();
    type = MachineType.wash;
  }

  Machine.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    userId = map["userId"];
    isActive = map["isActive"];
    date = (map["date"] as Timestamp).toDate();
    type = MachineType.getTypeFromString(map["type"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "userId": userId,
      "isActive": isActive,
      "date": date,
      "type": type.value,
    };
  }
}
