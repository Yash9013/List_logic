import 'package:flutter/material.dart';

RichText appText({required String text}) {
  return RichText(
    text: TextSpan(
      children: [
        const TextSpan(
          text: 'Name :-  ',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        TextSpan(
          text: text,
          style: const TextStyle(color: Colors.black),
        )
      ],
    ),
  );
}
