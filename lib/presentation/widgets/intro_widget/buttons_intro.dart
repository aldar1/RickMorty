import 'package:flutter/material.dart';

class ButtonsIntro extends StatelessWidget {
  const ButtonsIntro({super.key,  
    required this.titleButton, 
    required this.color,
    required this.stopEnd
  });

  final String titleButton;
  final Color color;
  final double stopEnd;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF80F66F),
            color
          ],
          stops: [
            0.05,
            stopEnd
          ]
        )
      ),
      child: MaterialButton(
        height: 50,
        onPressed: (){
          Navigator.pushReplacementNamed(context, '/signup');
        },
        child: Text(titleButton,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
      ),
    );
  }
}