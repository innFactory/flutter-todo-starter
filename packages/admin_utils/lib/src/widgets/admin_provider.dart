import 'package:flutter/widgets.dart';

/// Provides admin screen configuration for the sub-tree.
class AdminProvider extends InheritedWidget {
  const AdminProvider({
    super.key,
    required this.children,
    required super.child,
  });

  static AdminProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AdminProvider>()!;
  }

  final List<Widget> children;

  @override
  bool updateShouldNotify(covariant AdminProvider oldWidget) {
    return children != oldWidget.children;
  }
}
