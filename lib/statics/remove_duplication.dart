import 'dart:convert';

class RemoveDuplication {
  static List<T> fromObjectList<T>(
      {required List<T> list, required String target}) {
    var seen = Set<String>();
    List<T> uniqueList = list
        .where((obj) => seen.add(jsonDecode(obj.toString())['target']))
        .toList();

    return uniqueList;
  }
}
