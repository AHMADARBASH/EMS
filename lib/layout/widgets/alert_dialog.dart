// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

void showErrorDialog(
    {required BuildContext context,
    required String title,
    required String content,
    String boldContent = ''}) async {
  await Future.delayed(Duration.zero);
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
            title: Text(title),
            content: RichText(
              text: TextSpan(
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(text: content),
                    TextSpan(
                        text: boldContent,
                        style: const TextStyle(fontWeight: FontWeight.bold))
                  ]),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary),
                child: const Text('ok'),
              )
            ],
          ));
}

Widget showConfirmationDialog(
    {required BuildContext context,
    required String title,
    required String content,
    String boldContent = '',
    required Widget elevatedButtonContent,
    required Color elevatedButtonColor,
    required VoidCallback action,
    Color titleColor = Colors.black}) {
  return AlertDialog(
    title: Text(
      title,
      style: TextStyle(color: titleColor),
    ),
    content: RichText(
      text: TextSpan(
          style: const TextStyle(
            color: Colors.black,
          ),
          children: [
            TextSpan(text: content),
            TextSpan(
                text: boldContent,
                style: const TextStyle(fontWeight: FontWeight.bold))
          ]),
    ),
    actions: [
      ElevatedButton(
        onPressed: action,
        child: elevatedButtonContent,
        style: ElevatedButton.styleFrom(backgroundColor: elevatedButtonColor),
      ),
      TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('no'))
    ],
  );
}
