import 'package:flutter/material.dart';

class MyBadge extends StatelessWidget {
  final Widget child; // our badge widget will wrap this child widget
// what displays inside the badge
  final Color color; // the  background color of the badge - default is red

  const MyBadge({
    Key? key,
    required this.child,
    this.color = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: color,
            ),
            constraints: const BoxConstraints(
              minWidth: 8,
              minHeight: 8,
            ),
          ),
        )
      ],
    );
  }
}
