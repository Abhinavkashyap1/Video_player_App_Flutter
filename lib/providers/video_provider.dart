import 'package:flutter/material.dart';

class VideoProvider extends ChangeNotifier {
  bool isMuted = false;
  bool showPiP = true;
  bool isFullScreen = false;

  void toggleMute() {
    isMuted = !isMuted;
    notifyListeners();
  }

  void closePiP() {
    showPiP = false;
    notifyListeners();
  }

  void showPiPPlayer() {
    showPiP = true;
    notifyListeners();
  }

  void toggleFullScreen() {
    isFullScreen = !isFullScreen;
    notifyListeners();
  }
}
