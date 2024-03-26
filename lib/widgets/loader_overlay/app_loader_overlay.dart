import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'app_progress_indicator.dart';

export 'package:loader_overlay/src/overlay_controller_widget_extension.dart';

class AppLoaderOverlay extends StatelessWidget {
  const AppLoaderOverlay({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      overlayColor: Colors.black,
      useDefaultLoading: false,
      disableBackButton: false,
      overlayWholeScreen: false,
      overlayWidgetBuilder: (_) {
        return const AppProgressIndicator();
      },
      child: child,
    );
  }
}
