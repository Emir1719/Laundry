class Note {
  late String _fileNo, _degree, _comment, _mode;

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
  Note.fromMap(Map<String, dynamic> userMap) {
    fileNo = userMap["fileNo"];
    degree = userMap["degree"];
    mode = userMap["mode"];
    comment = userMap["comment"];
  }

  Map<String, dynamic> toMap() {
    return {
      "fileNo": fileNo,
      "degree": degree,
      "mode": mode,
      "comment": comment,
    };
  }

  String get fileNo => _fileNo;
  String get degree => _degree;
  String get comment => _comment;
  String get mode => _mode;

  set fileNo(String fileNo) => _fileNo = fileNo;
  set degree(String degree) => _degree = degree;
  set comment(String comment) => _comment = comment;
  set mode(String mode) => _mode = mode;
}
