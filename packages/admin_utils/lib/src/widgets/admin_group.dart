import 'package:admin_utils/src/widgets/admin_title.dart';
import 'package:flutter/material.dart';

class AdminGroup extends StatelessWidget {
  const AdminGroup({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AdminTitle(title),
        ...children,
      ],
    );
  }
}
