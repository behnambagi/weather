import 'dart:async';
import 'dart:ui';


class Debounce {
  final int milliseconds;
  Timer? _timer;

  Debounce({required this.milliseconds});

  run(VoidCallback action) {
    if (_timer!=null) _timer!.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}