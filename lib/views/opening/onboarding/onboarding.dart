import 'package:flutter/material.dart';
import 'package:flutter_foode/core/core_shelf.dart';
import 'package:provider/provider.dart';

import '../../../core/init/metrics.dart';
import '../../../core/init/navigate.dart';
import '../../../core/providers/onboard_providers.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_theme.dart';
import '../../../core/widgets/buttons/solid_button.dart';
import '../../../core/widgets/logo/logo.dart';
import 'get_started.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, OnboardProvider state, Widget? child) {
        var item = onboardPages(context)[state.page];

        return Container(
          width: w(context),
          height: h(context),
          child: Stack(
            children: [
              Container(
                width: w(context),
                height: h(context),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.7),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              horizontalpadding(
                context,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: hh(context, 50)),
                    logo(
                      context,
                      foodStyle: head18(context, AppColors.white),
                      eStyle: head18(context, AppColors.primary),
                    ),
                    Spacer(),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 1240),
                      child: item.title,
                    ),
                    Text(
                      item.message,
                      style: body(context, AppColors.white),
                    ),
                    SizedBox(height: hh(context, 50)),
                    SolidBorderedButton(
                      onTap: () {
                        if (state.page < 2)
                          state.changePage(state.page + 1);
                        else {
                          replaceTo(context, GetStarted());
                        }
                      },
                      text: state.page == 2 ? "GET STARTED" : "NEXT",
                      bgColor: AppColors.primary,
                      borderColor: AppColors.primary,
                      textColor: AppColors.white,
                    ),
                    SizedBox(height: hh(context, 50)),
                  ],
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(item.imgPath.toImgPng), fit: BoxFit.cover),
          ),
        );
      }),
    );
  }
}

class OnboardingModel {
  final int id;
  final String imgPath;
  final Widget title;
  final String message;

  OnboardingModel(this.id, this.imgPath, this.title, this.message);
}

List<OnboardingModel> onboardPages(BuildContext context) => [
      OnboardingModel(
        0,
        "ob0",
        Container(
          width: ww(context, 129),
          child: RichText(
            text: TextSpan(
              style: head36(context, AppColors.white),
              children: [
                TextSpan(
                  text: "AWESOME ",
                ),
                TextSpan(
                  text: "LOCAL ",
                  style: head36(context, AppColors.primary),
                ),
                TextSpan(
                  text: "FOOD",
                ),
              ],
            ),
          ),
        ),
        "Discover delicious food from the amazing restaurants near you",
      ),
      OnboardingModel(
        1,
        "ob2",
        Container(
          width: ww(context, 175),
          child: RichText(
            text: TextSpan(
              style: head36(context, AppColors.white),
              children: [
                TextSpan(
                  text: "DELIVERED AT ",
                ),
                TextSpan(
                  text: "YOUR ",
                ),
                TextSpan(
                  text: "DOORSTEP",
                  style: head36(context, AppColors.primary),
                ),
              ],
            ),
          ),
        ),
        "Fresh and delicious local food delivered from the restaurants to your doorstep",
      ),
      OnboardingModel(
        2,
        "ob1",
        Container(
          width: ww(context, 222),
          child: RichText(
            text: TextSpan(
              style: head36(context, AppColors.white),
              children: [
                TextSpan(
                  text: "GRAB THE BEST ",
                ),
                TextSpan(
                  text: "DEALS ",
                  style: head36(context, AppColors.primary),
                ),
                TextSpan(
                  text: "AROUND",
                ),
              ],
            ),
          ),
        ),
        "Grab the best deals and discounts around and save on your every order",
      ),
    ];
