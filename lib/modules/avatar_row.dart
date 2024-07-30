import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvatarRow extends StatelessWidget {
  AvatarRow({
    super.key,
    required this.icon,
    required this.name,
    required this.color,
  });

  Icon icon;
  String name;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Row(
        children: [
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(
              icon.icon,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          const Spacer(),
          const Icon(
            CupertinoIcons.right_chevron,
            color: Colors.grey,
            size: 21,
          )
        ],
      ),
    );
  }
}
