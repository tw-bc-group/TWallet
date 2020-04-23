class Address {
  final String value;

  Address({this.value});

  static bool validateFormat(String address) {
    var formatReg = RegExp(r'^0x[a-fA-F0-9]{40}$');
    return formatReg.hasMatch(address);
  }
}
