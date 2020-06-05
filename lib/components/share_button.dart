import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  const ShareButton({
    Key key,
    this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(30),
      ),
      child: IconButton(
          icon: Icon(
            icon,
            size: 20,
          ),
          onPressed: onTap),
    );
  }
}
