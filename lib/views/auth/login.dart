import 'package:flutter/material.dart';
import 'package:flutter_foode/views/home/home.dart';
import '../../core/init/metrics.dart';
import '../../core/init/navigate.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/text_theme.dart';
import '../../core/widgets/buttons/solid_button.dart';
import '../../core/widgets/inputs/solid_input.dart';
import '../base.dart';
import '../main_page.dart';
import '../opening/onboarding/get_started.dart';
import '../widgets/navbar.dart';
import 'auth_header.dart';
import 'forgot_password.dart';
import 'register.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print((h(context) * 62) / 812);
    return Base(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthPageHeader(
              text: "LOGIN",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>GetStarted()));
              },
            ),
            SizedBox(height: hh(context, 238.3)),
            horizontalpadding(
              context,
              child: SolidInput(
                label: "EMAIL",
                hintText: "johndoe@email.com",
              ),
            ),
            SizedBox(height: hh(context, 30)),
            horizontalpadding(
              context,
              child: SolidInput(
                label: "PASSWORD",
                hintText: "Password",
                iconName: "Eye Open",
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: w20(context)),
              child: TextButton(
                onPressed: () => pushTo(context, ForgotPassword()),
                child: Text(
                  "Forgot Password?",
                  style: body(context, textSecondary),
                ),
              ),
            ),
            SizedBox(height: hh(context, 50)),
            horizontalpadding(
              context,
              child: SolidBorderedButton(
                 onTap: () => pushTo(context, MainPage()),
                text: "LOGIN",
                bgColor: AppColors.primary,
                borderColor: AppColors.primary,
                textColor: AppColors.white,
              ),
            ),
            SizedBox(height: hh(context, 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: body(context, textSecondary),
                ),
                TextButton(
                  onPressed: () => pushTo(context, Register()),
                  child: Text(
                    "Register",
                    style: body(context, AppColors.secondary),
                  ),
                ),
              ],
            ),
            SizedBox(height: hh(context, 50)),
          ],
        ),
      ),
    );
  }
}
