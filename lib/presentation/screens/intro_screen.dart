import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:animate_do/animate_do.dart';
import 'package:page_view_1/presentation/screens/signup_screen.dart';
import 'package:page_view_1/presentation/widgets/intro_widget/background_widget_2.dart';
import 'package:page_view_1/presentation/widgets/intro_widget/buttons_intro.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<Widget> pageLiquidSwipe= [
      SizedBox(
        child: Stack(
          children: [
            Image(
              image: const AssetImage('assets/intro/imagen2.jpg'),
              fit: BoxFit.cover,
              height: size.height,
            ),
            const Image(
              image: AssetImage('assets/intro/rickmorty.png'),
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black.withOpacity(0.07),
            ),
          ],
        ),
      ),
      BackgroundWidget2(size: size,assetImage: 'assets/intro/imagen1.jpg',paddingTop: size.height * 0.11,title: 'Descrubre esta aventura',subtitle: 'Se parte de ella y explora',textbody: 'Conoce a todos los personajes, revisa en que capitulos aparecieron y podras adentrarte a esta gran aventura'),
      BackgroundWidget2(size: size,assetImage: 'assets/intro/imagen4.jpg',paddingTop: size.height * 0.65,title: 'Descrubra personajes',subtitle: 'Morty Malvado',textbody: 'Evil Morty es un dictador frío, manipulador, sádico, astuto, despiadado, muy inteligente y tiránico, que casi refleja a la mayoría de los Ricks e incluso los supera en ocasiones.'),
      SizedBox(
        child: Stack(
          children: [
            Image(
              image: const AssetImage('assets/intro/imagen3.jpg'), 
              fit: BoxFit.cover,
              height: size.height, 
            ),
            Positioned(
              bottom: 30,
              child: Container(
                color: Colors.transparent,
                height: size.height,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FadeInDown(
                      from: size.height,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        // child: ButtonsIntro(titleButton: 'Continuar',color: const Color(0xFF00001C).withOpacity(0.5),stopEnd: 0.6),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.85)
                          ),
                          onPressed: (){
                            final route = MaterialPageRoute(
                              builder: (context) => const SignupScreen()
                            );
                            Navigator.push(context, route);
                          },
                          child: const Text('   Continuar   '),
                        ),
                      )
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ];

    return LiquidSwipe(
      slideIconWidget: const Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,),
      positionSlideIcon: 0.4,
      fullTransitionValue: 600,
      enableLoop: false,
      pages: pageLiquidSwipe
    );
  }
}









