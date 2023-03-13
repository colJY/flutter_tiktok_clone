import 'package:flutter/cupertino.dart';

class VideoConfig extends ChangeNotifier {
  bool autoMuted = false;

  void toggleAutoMute() {
    autoMuted = !autoMuted;
    notifyListeners();
  }
}

final videoConfig = VideoConfig();
