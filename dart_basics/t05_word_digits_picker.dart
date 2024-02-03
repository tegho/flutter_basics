// Task 05

/// Class to pick word-written digits from string.
/// Delimiter is ','. Case insensitive.
class PickWDigitsFromStr {
  late final Set<int> theDigits;
  final String param;
  static const Map<String, int> _dictionary = {
    'zero':   0,
    'one':    1,
    'two':    2,
    'three':  3,
    'four':   4,
    'five':   5,
    'six':    6,
    'seven':  7,
    'eight':  8,
    'nine':   9
  };

  PickWDigitsFromStr(this.param) {
    Set<int> result = {};

    for ( var s in param.toLowerCase().split(',') ) {
      int? n = _dictionary[ s.trim() ];
      if (n != null) result.add( n );
    }
    theDigits = Set.from(result);
  }
}