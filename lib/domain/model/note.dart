// ignore_for_file: unnecessary_getters_setters
class Note {
  late String _fileNo, _degree, _comment, _mode, _modeDry;

  Note() {
    _fileNo = "";
    _degree = "";
    _comment = "";
    _mode = "";
  }

  /*Note.create({required String id, required String email, required String name}) {
    this.id = id;
    this.email = email;
    this.name = name;
  }*/

  ///Map içindeki kullanıcıyı nesneye dönüştürür.
  Note.fromMap(Map<String, dynamic> map) {
    fileNo = map["fileNo"];
    degree = map["degree"];
    mode = map["mode"];
    comment = map["comment"];
    modeDry = map["modeDry"] ?? "";
  }

  Map<String, dynamic> toMap() {
    return {
      "fileNo": fileNo,
      "degree": degree,
      "mode": mode,
      "comment": comment,
      "modeDry": modeDry,
    };
  }

  String get fileNo => _fileNo;
  String get degree => _degree;
  String get comment => _comment;
  String get mode => _mode;
  String get modeDry => _modeDry;

  set fileNo(String fileNo) => _fileNo = fileNo;
  set degree(String degree) => _degree = degree;
  set comment(String comment) => _comment = comment;
  set mode(String mode) => _mode = mode;
  set modeDry(String mode) => _modeDry = mode;
}
