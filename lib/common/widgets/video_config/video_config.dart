import 'package:flutter/cupertino.dart';

// final videoConfig =
//     ValueNotifier(false); // changeNotifier와 달리 ture, false값만 필요할 때는 더 유용하다.
// final darkConfig = ValueNotifier(false);

class VideoConfig extends ChangeNotifier {
  bool isMuted = false;
  bool isAutoplay = false;

  void toggleIsMuted() {
    isMuted = !isMuted;
    notifyListeners();
  }

  void toggleAutoplay() {
    isAutoplay = !isAutoplay;
    notifyListeners();
  }
}
