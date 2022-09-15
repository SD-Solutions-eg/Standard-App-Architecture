
//this used if you want to round the date to 5 m
//this time var are changed if you want
const int time=5;
extension on DateTime {

  DateTime roundDown({Duration delta =  const Duration(minutes: time)}) {
    return DateTime.fromMillisecondsSinceEpoch(
        millisecondsSinceEpoch - millisecondsSinceEpoch % delta.inMilliseconds);
  }
}