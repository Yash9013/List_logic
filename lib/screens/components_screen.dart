import 'package:flutter/material.dart';

RichText appText({required String field,required String text}) {
  return RichText(
    text: TextSpan(
      children: [
         TextSpan(
          text: '$field :-  ',
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        TextSpan(
          text: text,
          style: const TextStyle(color: Colors.black),
        )
      ],
    ),
  );
}
