class Machine {
  late String id, userId;
  late bool isActive;

  Machine() {
    id = "";
    userId = "";
    isActive = true;
  }

  Machine.fromMap(Map<String, dynamic> userMap) {
    id = userMap["id"];
    userId = userMap["userId"];
    isActive = userMap["isActive"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "userId": userId,
      "isActive": isActive,
    };
  }
}
