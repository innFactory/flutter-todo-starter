import 'package:admin_utils/admin_utils.dart';
import 'package:flutter/widgets.dart';

/// Provides admin screen configuration for the sub-tree.
class AdminProvider extends InheritedWidget {
  const AdminProvider({
    super.key,
    required this.groups,
    required super.child,
  });

  static AdminProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AdminProvider>()!;
  }

  final List<AdminGroup> groups;

  @override
  bool updateShouldNotify(covariant AdminProvider oldWidget) {
    return groups != oldWidget.groups;
  }

}
