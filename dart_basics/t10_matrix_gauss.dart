// Task 10

class Matrix {
  late final List<List<double>> m;
  late final int columnsNumber;
  late final int rowsNumber;


  Matrix(this.columnsNumber, this.rowsNumber) {
    if ( ( columnsNumber < 0 ) || ( rowsNumber < 0 ) ) throw Exception('wrong size');
    if ( ( columnsNumber == 0 ) && ( rowsNumber == 0 ) ) throw Exception('either dimension must be nonzero');

    m = List.generate(rowsNumber, (index) =>
          List.generate(columnsNumber, (index) => 0)
    );
  }

  // static constructor to copy some other matrix
  factory Matrix.newCopy(Matrix from) {
    var res = Matrix(from.columnsNumber, from.rowsNumber);
    for (var i=0; i < from.rowsNumber; i++) {
      res.setRow(i, from.getRow(i));
    }
    return res;
  }

  List<double> getRow(int rowIndex) {
    if ( (rowIndex < 0) || (rowIndex >= rowsNumber) ) throw Exception('Index out of range');
    return m[rowIndex].toList();
  }

  void setRow(int rowIndex, List<double> array) {
    if ( (rowIndex < 0) || (rowIndex >= rowsNumber) ) throw Exception('Index out of range');
    if ( array.length != columnsNumber ) throw Exception('Array length mismatch');
    m[rowIndex] = array.toList();
  }

  List<double> getColumn(int columnIndex) {
    if ( (columnIndex < 0) || (columnIndex >= columnsNumber) ) throw Exception('Index out of range');
    List<double> t = [];
    for (var row in m) {
      t.add( row[columnIndex] );
    }
    return t.toList();
  }

  void setColumn(int columnIndex, List<double> array) {
    if ( (columnIndex < 0) || (columnIndex >= columnsNumber) ) throw Exception('Index out of range');
    if ( array.length != rowsNumber ) throw Exception('Array length mismatch');
    for (var i=0; i < rowsNumber; i++ ) {
      m[i][columnIndex] = array[i];
    }
  }

  double val(int columnIndex, int rowIndex) {
    if ( (columnIndex < 0) || (columnIndex >= columnsNumber) ) throw Exception('Index out of range');
    if ( (rowIndex < 0) || (rowIndex >= rowsNumber) ) throw Exception('Index out of range');
    return m[rowIndex][columnIndex];
  }
}


class SolveGauss {
  late final Matrix matrix;
  late final double _precision;
  late final List solutions;

  // precision = 0 means not use it
  SolveGauss( Matrix matrix, [ double precision = 1e-12 ] ) {
    this.matrix = Matrix.newCopy(matrix);
    if ( ( precision < 0 ) || ( precision > 1 ) ) throw Exception('Incorrect precision.');

    _precision = (precision == 0) ? 0 : ( 1 / precision ).roundToDouble();
    _doit();
  }

  void makeMatrixPrecise ( ) {

    if ( _precision == 0 ) return;
    for (var n=0; n<matrix.rowsNumber; n++) {

      var row = matrix.getRow(n);
      for (var i=0; i<row.length; i++) {

        row[i] = makeValuePrecise( row[i] );
      }
      matrix.setRow(n, row);
    }
  }

  double makeValuePrecise ( double val ) {
    if ( _precision == 0 ) return val;
    return ( val * _precision ).roundToDouble() / _precision;
  }

  void swapRows(int rowIndex1, int rowIndex2) {
    var t = matrix.getRow(rowIndex1);
    matrix.setRow(rowIndex1, matrix.getRow(rowIndex2));
    matrix.setRow(rowIndex2, t);
  }

  void swapColumns(int columnIndex1, int columnIndex2) {
    var t = matrix.getColumn(columnIndex1);
    matrix.setColumn(columnIndex1, matrix.getColumn(columnIndex2));
    matrix.setColumn(columnIndex2, t);
  }

  void multiplyRow(int rowIndex, double multiplier) {
    var t = matrix.getRow( rowIndex );
    for (var i=0; i < matrix.columnsNumber; i++ ) {
      t[i] *= multiplier;
    }
    matrix.setRow(rowIndex, t);
  }

  // void multiplyColumn(int columnIndex, double multiplier) {
  //   var t = matrix.getColumn(columnIndex);
  //   for (var i=0; i < matrix.rowsNumber; i++)  {
  //     t[i] = makePrecise( t[i] * multiplier );
  //   }
  //   matrix.setColumn(columnIndex, t);
  // }

  /// [row1] = [row1] + multiplier * [row2]
  void sumMultipliedRow(int rowIndex1, int rowIndex2, double multiplier) {
    var t1 = matrix.getRow( rowIndex1 );
    var t2 = matrix.getRow( rowIndex2 );
    for (var i=0; i < matrix.columnsNumber; i++ ) {
      t1[i] += t2[i] * multiplier;
    }
    matrix.setRow(rowIndex1, t1);
  }

  // /// [column1] = [column1] + multiplier * [column2]
  // void sumMultipliedColumns(int columnIndex1, int columnIndex2, double multiplier) {
  //   var t1 = matrix.getColumn( columnIndex1 );
  //   var t2 = matrix.getColumn( columnIndex2 );
  //   for (var i=0; i < matrix.rowsNumber; i++ ) {
  //     t1[i] = makePrecise( t1[i] + t2[i] * multiplier );
  //   }
  //   matrix.setColumn(columnIndex1, t1);
  // }

  /// look for zero elements before beforeIndex not including one
  /// if beforeIndex is 0 or out of range, returns true
  bool _hasOnlyZeroesBefore(List<double> arr, int beforeIndex) {
    if ( beforeIndex > arr.length ) return true;
    for (var i=beforeIndex-1; i >= 0; i--)  {
      if ( arr[i] != 0 ) return false;
      // print('... ${arr[i]}');
    }
    return true;
  }

  /// find index of a first maximum element.abs() in list
  /// OR index of first (1).abs() in list
  int _indexOfLeader(List<double> array, int start) {
    double maxVal = 0;
    int maxPos = -1;

    for (var i=start; i < array.length; i++ ) {
      // find max element
      if ( array[i].abs() > maxVal ) {
        maxVal = array[i].abs();
        maxPos = i;
      }
      // or return if found 1.abs()
      if ( array[i].abs() == 1 ) return i;
    }
    return maxPos;
  }

  /// Find a leading element in matrix starting from position.
  /// Move the row containing it to the top. Return element's index
  /// If all elements.abs() are zero, return -1
  int _findLeadingElemColumn(int colStart, int rowStart) {

    int maxPos = 0;
    for (var c=colStart; c < matrix.columnsNumber; c++ ) {
      //  get next column
      var col = matrix.getColumn(c);

      // get leader
      maxPos = _indexOfLeader(col, rowStart);
      if ( maxPos >= 0 ) {
        if (col[maxPos] == 0) {
          continue;
        }
        swapRows(maxPos, rowStart);
        return(c);
      }
    }
    return -1;
  }

  /// Operator v1 * v2
  /// supports only doubles and strings
  /// return double or string, compatible with linux bc
  Object _untypedMul(double v1, Object v2) {
    if ( v2 is double ) {
      // return v1 * v2;
      return makeValuePrecise(v1 * v2);
    } else {
      if ( v1 == 1 ) return '($v2)';
      if ( v1 == 0 ) return 0;
      return '($v1)*($v2)';
    }
  }
  /// Operator v1 - v2
  /// supports only doubles and strings
  /// return double or string, compatible with linux bc
  Object _untypedSub(Object v1, Object v2) {
    if ( ( v1 is double ) && ( v2 is double ) ) return makeValuePrecise( v1 - v2 );

    String s1;
    String s2;
    String operation='-';
    if ( v2 is double ) {
      if ( v2 < 0 ) {
        v2 *= -1;
        operation = '+';
        s2 = '($v2)';
      } else if ( v2 == 0 ) {
        operation = '';
        s2 = '';
      } else {
        s2 = '($v2)';
      }
    } else {
      s2 = '(${v2 as String})';
    }

    if ( v1 is double ) {
      if ( v1 == 0 ) {
        s1 = '';
      } else {
        s1 = '($v1)';
      }
    } else {
      s1 = '(${v1 as String})';
    }

    if ( (s1.isEmpty) && (operation=='+') ) return (v2 is double)?v2:s2;
    if (s2.isEmpty) return (v1 is double)?v1:s1;
    return '$s1$operation$s2';
  }


  void _doit() {

    /// 1) transforming matrix to upper triangular form

    int c = 0;
    int r = 0;
    while (true) {

      /// find leading element in a column starting from column (c) starting from row (r)
      c = _findLeadingElemColumn(c,r);
      /// all columns contains only zeroes
      if ( c < 0 ) break;

      /// divide leading row by leading element
      multiplyRow(r, 1/matrix.val(c,r));

      /// go through all elements in leading column after the leading one
      for (var i=r+1; i<matrix.rowsNumber; i++) {

        var multiplier = - matrix.val(c,i) / matrix.val(c,r);
        /// [i] = [i] + multiplier * [r]
        sumMultipliedRow(i, r, multiplier);
      }

      c++;
      r++;
      if ( c >= matrix.columnsNumber ) break;
      if ( r >= matrix.rowsNumber ) break;
    }

    makeMatrixPrecise();
// print(matrix.m);

    /// 2) getting variables values

    List ret = [];

    // starting from bottom row
    int i = matrix.columnsNumber - 2;
    while (true) {

      List<double> rowi = [];
      int? rowNum;

      // look for a row where [i,i] element is 1 and the zeroes only to the left of it
      for (var n=i; n>=0; n--) {
        rowNum = null;

        // look for a row where [i,i] element is 1
        try {
          if ( matrix.val(i, n) == 1 ) rowNum = n;
        } catch (_) {}

        // some row found
        if ( rowNum != null ) {
          rowi = matrix.getRow(rowNum);

          // check if all elements to the left are 0
          if ( _hasOnlyZeroesBefore(rowi, i) ) {
            // this is it
            // i = rowNum;
            break;
          } else {
            // it is not
            rowNum = null;
          }
        }
      }

      // if we are looking for the last var an cannot find one, then
      // check if there is any solution exist
      if ( ( i == matrix.columnsNumber - 2 ) && ( rowNum == null ) ) {

        // starting from bottom
        for (var k=matrix.columnsNumber - 2; k>=0; k--) {
          List<double> rowk = [];

          try {
            rowk = matrix.getRow(k);
          } catch (_) {}

          // check if row is zeroed but the answer is not
          if ( (rowk.isNotEmpty) && ( _hasOnlyZeroesBefore(rowk, matrix.columnsNumber-1) ) && ( rowk[matrix.columnsNumber-1] != 0 ) ) {
            // print('No solution here.');
            solutions = [];
            return;
          }
        }
      }

      // There is some solution exists...

      // if var coefficient is present and is not 1 then it is 0 (free var)
      if ( rowNum == null ) {
        ret.insert( 0, 'x${i+1}' );
      } else {
        // if var coefficient is 1

        // this might become a double or string
        Object ans;

        // read answer for this row
        ans = rowi[matrix.columnsNumber-1];
        // go through all coefficients to the right
        for (var n=i+1; n<matrix.columnsNumber-1; n++) {

          // read next coefficient
          double an = rowi[n];

          // ret[n-i-1] is the variable for this coefficient
          // ans = ans - an * ret[n-i-1]
          ans = _untypedSub( ans, _untypedMul(an, ret[n-i-1]) );
        }

        // push new founded variable
        ret.insert( 0, ans );
      }

      i--;
      if ( i < 0 ) break;
    }

    solutions = ret.toList();
  }
}
