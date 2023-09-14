// ignore_for_file: non_constant_identifier_names, unused_field, no_leading_underscores_for_local_identifiers

class Business {
  late int ID;
  late String Name;
  late String Address;
  late String Phone;
  late String Icon;

  Business(String _name, String _address, String _phone, String _icon) {
    Name = _name;
    Address = _address;
    Phone = _phone;
    Icon = _icon;
  }
  Business.withID(
      int _id, String _name, String _address, String _phone, String _icon) {
    ID = _id;
    Name = _name;
    Address = _address;
    Phone = _phone;
    Icon = _icon;
  }

  static Business NoBusiness() {
    return Business.withID(-1, '', '', '', 'business');
  }
}
