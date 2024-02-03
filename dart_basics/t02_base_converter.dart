// Task 02

import 'dart:math' show pow;

/// Class to convert x-based integers.
/// Base2 and base10 only supported.
/// Negatives supported.
class BaseConverter {
  late final int valInt;
  late final String valStr;
  final int _lenBinary;

  // convert integer to binary string of _lenBinary bits
  String _intToBinaryStr(int valInt) {
    var i = valInt;
    String resultStr = '';

    // get LSB and shift
    while ( (i != 0) && (i != -1) ) {
      resultStr = ( i.isOdd ? '1':'0' ) + resultStr;
      i >>= 1;
    }
    resultStr = resultStr.padLeft(_lenBinary, valInt.isNegative ? '1':'0');
    return resultStr;
  }

  // convert binary string of _lenBinary bits to integer
  int _binaryStrToInt(String str) {
    int resultInt = 0;

    // if negative number
    bool negNum = str[0] == '1';

    // each digit considered as 0 or 1 depended on negNum
    for ( int i=( negNum ? 0:1 ); i<str.length; i++ ) {
      bool t = str[i] == '1';
      resultInt += pow(2, str.length -i -1).toInt() * ( (t ^ negNum) ? 1:0) ;
    }
    if ( negNum ) {
      resultInt = -1 * resultInt -1;
    }
    return resultInt;
  }

  /// Constructor with dynamic parameter. Negative int supported.
  ///   val is integer or binary string without 'b' prefix.
  ///   _lenBinary is optional binary string, 16 by default.
  /// Up to 53 bits because of web limitations.
  BaseConverter(dynamic val, [this._lenBinary = 16]) {
    if (_lenBinary < 1) throw ArgumentError.value(_lenBinary, '_lenBinary', 'String is too short');
    if (_lenBinary > 53) throw ArgumentError.value(_lenBinary, '_lenBinary', 'String longer than 53 bits is not supported on web platforms');
    switch (val.runtimeType) {
      case int:
        valInt = val;
        int lenNeeded = val.bitLength + ( val.isNegative ? 1:0 );
        if ( lenNeeded > _lenBinary ) throw  RangeError.value(val, 'val', 'String must be at least length $lenNeeded to fit this value');
        valStr = _intToBinaryStr(val);
        break;

      case String:
        if (val.isEmpty) throw ArgumentError('Binary string is empty','val');
        if (val.length > 53) throw ArgumentError.value(val.length, 'val', 'String longer than 53 bits is not supported on web platforms');
        if (val.length > _lenBinary) throw ArgumentError('Binary string is longer than $_lenBinary bits','val');
        for (int i=0; i<val.length; i++) {
          // check string for any symbols except '0' and '1'
          if ( (val[i] != '0') && (val[i] != '1') ) throw ArgumentError.value(val[i], 'val', 'Incorrect symbols in binary string');
        }
        valStr = val.padLeft(_lenBinary, '0');
        valInt = _binaryStrToInt(valStr);
        break;

      default:
        throw ArgumentError.value(val, 'val', 'Only integer or string allowed');
    }
  }
}