// ignore_for_file: non_constant_identifier_names

import 'package:testApp/entities/business.dart';

class BusinessList {
  static List<Business> businesses = [
    Business.withID(
        1, 'GPos', '48700 Marmaris/Muğla', '+90530 000 00 00', 'business'),
    Business.withID(
        2, 'ESoft', '48700 Marmaris/Muğla', '+90531 111 11 11', 'business'),
    Business.withID(3, 'Dominik Pizza', '48700 Marmaris/Muğla',
        '+90252 222 22 22', 'favorite')
  ];

  static AddBusinessNoObject(
      String isim, String Adrress, String Phone, String ico) {
    var bs = Business(isim, Adrress, Phone, ico);
    bs.ID = businesses.length + 1;
    businesses.add(bs);
  }

  static AddBusiness(Business business) {
    businesses
        .add(Business(business.Name, business.Address, business.Phone, 'add'));
  }
}
