// Task 07

/// Extends 'num' with some math methods.
extension MyMath on num {

  /// Raises val to the power 'exp'.
  ///   'exp' is a positive integer.
  /// 2k-ary method.
  /// Consider that overflow of the 'num' on any platform
  ///   either toggles Negative bit
  ///   OR makes some MSB lost
  num _powInt(num val, int exp) {

    if ( exp < 0 )  throw ArgumentError('Not supported here.');
    if ( ( exp == 0 ) || ( val == 1 ) ) return 1;
    if ( val == 0 ) return 0;
    if ( val == -1 ) return (exp.isOdd) ? -1:1;
    if ( exp == 1 ) return val;

    num a = 1;
    num b = 1;
    for (var k=exp.bitLength-1; k>0; k--) {
      if ( exp & 1<<k != 0 ) b *= val;
      b *= b;
      // Overflow checking
      if ( ( b < a ) && ( val.abs() > 1 ) ) throw ArgumentError('Multiplication overflow (1).');
      a = b;
    }

    if (exp.isOdd) b *= val;
    // Overflow checking
    if (
        ( val.abs() > 1 ) &&
        (
          (( b < a ) && ( val > 0 )) ||
          (( b > a ) && ( val < 0 ))
        )
    ) throw ArgumentError('Multiplication overflow (2).');

    return b;
  }

  /// Gets n-th root with precision 'precision'.
  num nthRoot(int n, {double precision = 1e-6, num guess = 3} ) {

    if ( this == 0 ) return 0;
    if ( this == 1 ) return 1;
    if ( (this < 0 ) && n.isEven ) throw ArgumentError('No solution for this arguments.');
    if ( n == 1 ) return this;
    if ( n == 0 ) throw ArgumentError('No solution for zero-th root.');
    if ( n < 0 )  throw ArgumentError('Not supported here.');

    num x1 = 0;
    num x2 = guess;
    int fuse = 0;

    while ( (x1 - x2).abs() > precision ) {
      x1 = x2;
      num p = 1;
      p = _powInt(x1, n-1);
      x2 = x1*(n-1)/n + this/n/p;
      fuse++;
      if (fuse > 1000) throw Exception('Too many iterations, try to decrease precision or take a better guess.');
    }

    return x2;
  }
}

