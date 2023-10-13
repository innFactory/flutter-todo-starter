import 'package:admin_utils/src/router.gm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

mixin AdminGestureWrapper on Widget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return AdminGestureDetector(child: this);
  }
}

class AdminGestureDetector extends StatefulWidget {
  const AdminGestureDetector({
    super.key,
    this.pointers = kDebugMode ? 1 : 3,
    this.taps = 3,
    required this.child,
  });

  /// The amount of pointers (fingers) that must be on the screen.
  final int pointers;

  /// The amount of taps the user has to do.
  final int taps;

  final Widget child;

  @override
  State<AdminGestureDetector> createState() => _AdminGestureDetectorState();
}

class _AdminGestureDetectorState extends State<AdminGestureDetector> {
  DateTime? lastTap;
  int tapCount = 0;
  Set<int> pointersDown = {};

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      behavior: HitTestBehavior.translucent,
      gestures: {
        MultiTapGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<MultiTapGestureRecognizer>(
          () => MultiTapGestureRecognizer(),
          (instance) {
            instance.onTapDown = (pointer, details) {
              pointersDown.add(pointer);

              if (pointersDown.length == widget.pointers) {
                final now = DateTime.now();
                if (lastTap != null &&
                    now.difference(lastTap!).inMilliseconds < 250) {
                  tapCount++;
                } else {
                  tapCount = 1;
                }
                lastTap = now;

                if (tapCount == widget.taps) {
                  tapCount = 0;
                  lastTap = null;
                  pointersDown.clear();
                  context.router.root.push(const AdminRoute());
                }
              }
            };

            instance.onTapUp =
                (pointer, details) => pointersDown.remove(pointer);
            instance.onTapCancel = (pointer) => pointersDown.remove(pointer);
          },
        ),
      },
      child: widget.child,
    );
  }
}
