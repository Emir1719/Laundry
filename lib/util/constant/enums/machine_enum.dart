enum MachineType {
  wash("Yıkama"),
  dry("Kurutma"),
  both("Çoklu");

  final String value;

  const MachineType(this.value);

  static MachineType getTypeFromString(String typeString) {
    switch (typeString) {
      case "Yıkama":
        return MachineType.wash;
      case "Kurutma":
        return MachineType.dry;
      case "Çoklu":
        return MachineType.both;
      default:
        throw Exception("Geçersiz makine tipi: $typeString");
    }
  }
}
