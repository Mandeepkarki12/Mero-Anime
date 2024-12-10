import 'package:flutter/material.dart';

class SwitchScreen extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopBody;
  const SwitchScreen(
      {super.key, required this.mobileBody, required this.desktopBody});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constriants) {
      if (constriants.maxWidth < 600) {
        return mobileBody;
      } else {
        return desktopBody;
      }
    });
  }
}
