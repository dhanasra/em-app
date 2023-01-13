import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../resources/style_manager.dart';
import '../../../resources/values_manager.dart';

class RichTextSpan extends StatelessWidget {
  const RichTextSpan({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p32),
      child: RichText(
      text: TextSpan(
        text: "By creating an account you agree to our  ",
        style: getBodyText2Style(context),
        children: [
          TextSpan(
            text: "Terms of Service",
            recognizer: TapGestureRecognizer()
            ..onTap = () {
              
            },
            style: getBodyText1Style(context).copyWith(decoration: TextDecoration.underline)
          ),
          const TextSpan(
            text: "  and  "
          ),
          TextSpan(
            text: "Privacy Policy",
            recognizer: TapGestureRecognizer()
            ..onTap = () {
              
            },
            style: getBodyText1Style(context).copyWith(decoration: TextDecoration.underline)
          )
        ]
      )),
    );
  }
}