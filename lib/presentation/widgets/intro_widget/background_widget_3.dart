import 'package:flutter/material.dart';
import 'package:page_view_1/presentation/widgets/intro_widget/liquid_text.dart';


class BackgroundWidget2 extends StatelessWidget {
  const BackgroundWidget2({super.key, 
    required this.size, 
    required this.assetImage, 
    required this.paddingTop, 
    required this.title, 
    required this.subtitle, 
    required this.textbody, 
  });

  final Size size;
  final String assetImage;
  final double paddingTop;
  final String title;
  final String subtitle;
  final String textbody;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage(assetImage),
                fit: BoxFit.cover,
                height: size.height,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.transparent,
                    ],
                    stops: const [0,0.4]
                  )
                ),
              ),
              
              LiquidText(paddingTop: paddingTop,title: title,subtitle: subtitle,textbody: textbody,)
            ],
          ),
        ],
      ),
    );
  }
}