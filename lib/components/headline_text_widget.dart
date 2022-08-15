import 'package:flutter/material.dart';

import '../utils/constants/text_style_constant.dart';

class HeadlineText extends StatelessWidget {
  final String text;
  const HeadlineText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyleConstants.bold26,
        ),
      ),
    );
  }
}
