import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
    this.onTap,
    this.icon,
    this.color,
    required this.text1,
  });
  final void Function()? onTap;
  final IconData? icon;
  final Color? color;
  final String text1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 46,
          child: Column(
            children: [
              Icon(
                icon,
                color: color,
              ),
              Text(
                text1,
                style: TextStyle(
                    color: color, fontSize: 15, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ));
  }
}
