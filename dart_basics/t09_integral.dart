// Task 09

/// Constructor does all the math and stores integral sum in 'result' property.
/// Throws exception if function brake detected on the interval.
/// Consider a function break is around when function grows too fast.
/// Consider a function break is around when (delta(f).abs() * delta(x) > 1 )
class Integral {
  final Function(double) funcOriginal;
  late final double xIntervalStart;
  late final double xIntervalEnd;
  late final double xIntervalStep;
  late final double result;


  // constructor
  Integral( this.funcOriginal, this.xIntervalStart, this.xIntervalEnd, [ this.xIntervalStep = 1e-3 ] ) {

    var xRange = xIntervalEnd - xIntervalStart;
    if ( xRange <= 0 ) {
      throw ArgumentError('Incorrect range.');
    }

    if ( ( xIntervalStep <= 0 ) || ( xRange / xIntervalStep < 10 ) ) {
      throw ArgumentError.value(xIntervalStep, 'xIntervalStep', 'Incorrect step.');
    }

    var sum = doTheMath(xIntervalStart, xIntervalEnd, xIntervalStep);
    if ( ! sum.isFinite )  throw Exception('Found brakes on interval.');

    result = sum;
  }


  // /// function derivative method
  // double _dFunc( List<double> f, double divDx ) {
  //   // f( x - dx )
  //   double p1 = f[ f.length - 2 ];
  //   // f( x )
  //   double p2 = f.last;
  //   return ( p2 - p1 ) * divDx;
  // }

  /// Function derivative method (simple).
  /// Since we are not interested in actual derivative value, but in cases
  /// when abs(function) grows too fast since a previous step, there is no need to
  /// divide delta(f) by delta(x) on each step to simplify the math.
  double _dFuncSimple( List<double> f ) {
    // f( x - dx )
    double p1 = f[ f.length - 2 ];
    // f( x )
    double p2 = f.last;
    return ( p2 - p1 ).abs();
  }


  double doTheMath( double intervalStart, double intervalEnd, double intervalStep ) {
    List<double> x  = [];
    List<double> f  = [];
    List<double> df = [];

    // sliding window could help in function analysis
    // must be at least 2 for this task
    int slideWidth = 2;
    // example for width = 2:
    //    x:  [0,1]
    //    f:  [0,1]
    //   df:  [  0]

    double sum = 0;
    x.add( intervalStart );

    // This loop have fixed dx, which is reduces some calculations
    double deltaFBreak = 1/xIntervalStep;
    while ( x.last <= intervalEnd ) {

      f.add( funcOriginal( x.last ));
      if ( f.length >= 2 ) df.add( _dFuncSimple(f) );

      if ( x.length > slideWidth ) {
        x.removeAt(0);
        f.removeAt(0);
        df.removeAt(0);
      }

      if ( ! f.last.isFinite ) {
        // // direct hit, x.last is the break
        // print('x=${x.last.toString().padRight(26)} xxx: direct hit!');
        return double.nan;
      }
      else {

        if ( f.length > 1 ) {
          // Left Riemann sum
          var h =  f[f.length - 2];
          sum += h;
        }

        if ( ( df.isNotEmpty ) && ( df.last > deltaFBreak ) ) {
          // print('x=${x.last.toString().padRight(26)} df=${df.last.toString().padRight(26)} $deltaFBreak ${df.last*xIntervalStep} xxx: about to brake');
          return double.nan;
        }
      }

      // do not care about very last step if it takes us out of interval, bc of fixed dx in sliding window
      // but check for a break on the end of the interval later
      x.add( x.last + intervalStep );
    }

    sum *= xIntervalStep;

    // Check the last step if it did not fit in the main loop.
    // dx from last-1 to last step is differs from the main loop and
    // intervalEnd have not been checked.
    if ( x.last > intervalEnd ) {

      x.removeLast();
      double deltaFBreak = 1 / ( intervalEnd - x.last  );
      x.add( intervalEnd );

      f.add( funcOriginal( x.last ));
      if ( f.length >= 2 ) df.add( _dFuncSimple(f) );

      if ( ! f.last.isFinite ) {
        // direct hit, intervalEnd is the break
        // print('x=${x.last.toString().padRight(26)} xxx: direct hit2!');
        return double.nan;
      }
      else {
        if ( f.length > 1 ) {
          var dx = x.last - x[x.length - 2];
          // Left Riemann sum
          var h =  f[f.length - 2];
          sum += h.abs() * dx;
        }

        if ( ( df.isNotEmpty ) && ( df.last > deltaFBreak ) ) {
          // print('x=${x.last.toString().padRight(26)} df=${df.last.toString().padRight(26)} xxx: about to brake2');
          return double.nan;
        }
      }
    }

    return sum;
  }

}
