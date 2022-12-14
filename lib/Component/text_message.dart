import 'package:flutter/material.dart';

import '../type.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    required this.message,
    required this.sender,
  }) : super(key: key);

  final bool sender;
  final String message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.65,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding * 0.75,
          vertical: defaultPadding / 2,
        ),
        decoration: BoxDecoration(
          color: secondaryColor.withOpacity(sender ? 1 : 0.1),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: sender ? Colors.white : Theme.of(context).textTheme.bodyText1!.color,
          ),
        ),
      ),
    );
  }
}
