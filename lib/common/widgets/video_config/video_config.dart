import 'package:flutter/widgets.dart';

class VideoConfigData extends InheritedWidget {
  final bool autoMute;

  final void Function() toggleMuted;

  const VideoConfigData({
    super.key,
    required this.autoMute,
    required this.toggleMuted,
    required super.child,
  });

  static VideoConfigData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<
        VideoConfigData>()!; //videoConfig 라는 타입의 InheritedWidget을 가져오라고 context에게 명령
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    //위젯을 rebuild할지 말지 결정
    return true;
  }
}

class VideoConfig extends StatefulWidget {
  final Widget child;
  const VideoConfig({
    super.key,
    required this.child,
  });

  @override
  State<VideoConfig> createState() => _VideoConfigState();
}

class _VideoConfigState extends State<VideoConfig> {
  bool autoMute = true;

  void toggleMuted() {
    setState(() {
      autoMute = !autoMute;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VideoConfigData(
      toggleMuted: toggleMuted,
      autoMute: autoMute,
      child: widget.child,
    );
  }
}
