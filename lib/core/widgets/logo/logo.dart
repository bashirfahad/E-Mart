import 'package:flutter/cupertino.dart';
import 'package:flutter_foode/core/theme/theme_shelf.dart';

Widget logo(BuildContext context, {TextStyle? foodStyle, TextStyle? eStyle}) =>
    RichText(
      text: TextSpan(
        style: foodStyle ?? head36(context, textPrimary(context)),
        children: [
          TextSpan(
            text: "Dana",
          ),
          TextSpan(
            text: "Paani",
            style: eStyle ?? head36(context, AppColors.primary),
          ),
        ],
      ),
    );
