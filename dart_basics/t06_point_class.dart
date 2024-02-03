// Task 06
import 'dart:math' show pow,sqrt;

/// Class 3d-point.
class Point {
  final double x;
  final double y;
  final double z;

  Point(this.x, this.y, this.z);

  double distanceTo(Point another) {
    return _distance2points(this, another);
  }

  double triangleSquare2p(Point p2, Point p3) {
    return triangleSquare(this, p2, p3);
  }

  static double _distance2points(Point p1, Point p2) {
    return sqrt( pow(p1.x - p2.x, 2) + pow(p1.y - p2.y, 2) + pow(p1.z - p2.z, 2) );
  }

  static double triangleSquare(Point p1, Point p2, Point p3) {
    // Heron's formula
    double a = _distance2points(p1, p2);
    double b = _distance2points(p1, p3);
    double c = _distance2points(p2, p3);
    double p = (a + b + c)/2;
    return sqrt( p * (p-a) * (p-b) * (p-c) );
  }

  factory Point.coordStart() {
    return Point(0, 0, 0);
  }

  factory Point.coordOrt() {
    return Point(1, 1, 1);
  }
}