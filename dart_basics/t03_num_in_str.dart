// Task 03

/// Class to find nums in string.
/// Integers pos, neg, dec and hex supported.
/// Doubles supported.
class PickNumsFromStr {
  late final List<num> numList;
  final String valStr;

  PickNumsFromStr(this.valStr) {
    List<num> t = [];
    List listOfElements = valStr.split(' ');

    for (var el in listOfElements) {
      if (el.isEmpty) continue;
      try {
        t.add( num.parse(el) );
      } on FormatException {
        // this is not a number
        continue;
      } on Exception catch (e) {
        // some other exception like overflow or etc
        // do not rethrow, just move on
        continue;
      }
    }
    numList = t.toList();
  }
}