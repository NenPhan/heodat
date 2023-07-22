extension IntExt on int {
  Duration get seconds => Duration(seconds: this);
  Duration get miliSeconds => Duration(milliseconds: this);
  Duration get minutes => Duration(minutes: this);
}
