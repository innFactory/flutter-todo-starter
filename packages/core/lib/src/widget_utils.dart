import 'package:core/core.dart';
import 'package:flutter/material.dart';

extension WidgetListX on Iterable<Widget> {
  List<Widget> separated(
    Widget Function(int index) separatorBuilder,
  ) {
    final expanded = expandIndexed((index, element) {
      return [element, separatorBuilder(index)];
    }).toList();

    if (expanded.isNotEmpty) {
      expanded.removeLast();
    }

    return expanded;
  }
}
