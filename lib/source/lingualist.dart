// ignore_for_file: non_constant_identifier_names

import 'package:testApp/entities/lingua.dart';

class WordList {
  static List<LinguaObject> ListLingua = [
    LinguaObject('nobody', 'No body'),
    LinguaObject('test', 'for a test'),
    LinguaObject('edit', 'Edit'),
    LinguaObject('delete', 'Remove'),
    LinguaObject('add', 'Add'),
    LinguaObject('yes', 'Yes'),
    LinguaObject('no', 'No'),
    LinguaObject('warning', 'Warning'),
    LinguaObject('areyousure', 'Do you want to perform this operation?')
  ];

  static bool AddNewWord(LinguaObject obj) {
    try {
      ListLingua.add(obj);
      return true;
    } catch (e) {
      return false;
    }
  }

  static String GetWord(String Keyu) {
    try {
      return ListLingua.firstWhere((element) => element.key == Keyu).value;
    } catch (e) {
      return 'key named "$Keyu" has no value';
    }
  }
}
