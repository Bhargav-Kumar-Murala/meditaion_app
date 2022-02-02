import 'package:flutter/material.dart';

navbar() {
  return Container(
    height: 80,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      boxShadow: const [
        BoxShadow(
          color: Color(0x11000000),
          blurRadius: 10,
          offset: Offset(0, -4),
        ),
      ],
      color: Colors.white,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Icon(
          Icons.house_siding_outlined,
          size: 36,
          color: Colors.blueAccent,
        ),
        Icon(
          Icons.auto_stories_outlined,
          size: 36,
          color: Colors.black54,
        ),
        Icon(
          Icons.emoji_nature_outlined,
          size: 36,
          color: Colors.black54,
        ),
        Icon(
          Icons.person_outline_outlined,
          size: 36,
          color: Colors.black54,
        ),
      ],
    ),
  );
}
