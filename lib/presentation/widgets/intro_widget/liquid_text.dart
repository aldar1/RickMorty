import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:page_view_1/presentation/styles/app_text_style.dart';


class LiquidText extends StatelessWidget {
  const LiquidText({super.key, 
    required this.paddingTop, 
    required this.title, 
    required this.subtitle, 
    required this.textbody,
  });

  final double paddingTop;
  final String title;
  final String subtitle;
  final String textbody;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 25,right: 25,top: paddingTop),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedTextKit(
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TyperAnimatedText(
                      title,
                      textStyle: AppTextStyle.titleIntro1,
                      speed: const Duration(milliseconds: 15)
                    ),
                  ]
                ),
                AnimatedTextKit(
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TyperAnimatedText(
                      subtitle,
                      textStyle: AppTextStyle.titleIntro2,
                      speed: const Duration(milliseconds: 15)
                    ),
                  ]
                ),
                const SizedBox(height: 15,),
                AnimatedTextKit(
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TyperAnimatedText(
                      textbody,
                      textStyle: AppTextStyle.titleIntro3,
                      speed: const Duration(milliseconds: 15)
                    ),
                  ]
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}