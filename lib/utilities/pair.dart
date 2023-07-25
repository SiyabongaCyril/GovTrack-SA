// Pair class, initially created to pair the start and end dates of a
// public servant's role and previous roles.
// Can be used to pair any two items of any type.
class Pair<T, U> {
  final T? first;
  final U? second;

  Pair({this.first, this.second});
  get firstItem => first;
  get secondItem => second;
}
