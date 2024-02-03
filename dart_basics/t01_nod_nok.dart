// Task 01

/// Class to find Nod and Nok for any number of integers.
/// Does not use 'gcd' method of 'int' class.
class NodNok {
  late final int nod;
  late final int nok;

  // nod for two integers
  int _nodPair(int a, int b) {
    if ( a < b ) {
      int t = b;
      b = a;
      a = t;
    }

    while ( b != 0 ) {
      a %= b;
      int t = b;
      b = a;
      a = t;
    }

    // Nod:
    if ( a == 0 ) a = 1;
    return a.abs();
  }

  // nok for two integers
  int _nokPair(int a, int b, int n) {

    int res = a ~/ n * b;
    return res.abs();
  }

  /// Constructor for list of integers
  NodNok(List numbers) {
    if (numbers.length < 2) throw ArgumentError.value(numbers.length, 'numbers', 'There must be at least two numbers');
    for (var n in numbers) {
      if (n is! int) throw ArgumentError.value(n, 'numbers', 'Only integers allowed');
    }

    int nod;
    int nok;

    nod = _nodPair(numbers[0], numbers[1]);
    // nod = (numbers[0]).gcd(numbers[1]);
    nok = _nokPair(numbers[0], numbers[1], nod);
    for (var i = 2; i < numbers.length; i++ ) {
      nod = _nodPair(nod, numbers[i]);
      nok = _nokPair(nok, numbers[i], _nodPair(nok, numbers[i]));
      // nod = nod.gcd(numbers[i]);
      // nok = _nokPair(nok, numbers[i], nok.gcd(numbers[i]));
    }

    this.nod = nod;
    this.nok = nok;
  }

  /// Constructor for two integers
  NodNok.pair(int a, int b) : this([a, b]);
}
