class CustomDuration {
  final int _millisecond;

  int get millisecond => _millisecond;

  CustomDuration(this._millisecond);

  // name constructor
  CustomDuration.fromhour(int hour)
    : _millisecond = hour < 0
          ? throw Exception("Hour can not be negative.")
          : hour * 60 * 60 * 1000;
  CustomDuration.fromMinutes(int min)
    : _millisecond = min < 0
          ? throw Exception("Minute can not be negative.")
          : min * 60 * 1000;
  CustomDuration.fromSeconds(int sec)
    : _millisecond = sec < 0
          ? throw Exception("Second can not be negative.")
          : sec * 1000;

  //Overloaded Operators
  CustomDuration operator +(CustomDuration other) {
    return CustomDuration(this._millisecond + other.millisecond);
  }

  CustomDuration operator -(CustomDuration other) {
    int result = this.millisecond - other._millisecond;
    if (result < 0) result = 0;
    return CustomDuration(result);
  }

  bool operator >(CustomDuration other) {
    return this._millisecond > other.millisecond;
  }

  @override
  String toString() => "$_millisecond ms";
}

void main() {

  var d1 = CustomDuration.fromSeconds(10);
  var d2 = CustomDuration.fromSeconds(4);

  print('d1: $d1');
  print('d2: $d2');

  print('Is d1 > d2?  ${d1 > d2}');
  print('Is d2 > d1?  ${d2 > d1}'); 

  var sum = d1 + d2;
  print('d1 + d2 = $sum'); 

  var diff1 = d1 - d2;
  print('d1 - d2 = $diff1'); 

  var diff2 = d2 - d1;
  print('d2 - d1 = $diff2'); 
}

