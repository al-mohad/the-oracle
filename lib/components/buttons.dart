import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final child;
  final double height;
  final double width;
  final Function onTap;
  button({this.child, this.height, this.width, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15),
        ),
        child: child,
      ),
    );
  }
}
