import 'package:flutter/material.dart';

class ButtonStyle1 extends StatelessWidget {
  const ButtonStyle1({
    super.key,
    required this.size, 
    required this.marginContainer, 
    required this.text, 
    required this.iconData,

  });

  final Size size;
  final double marginContainer;
  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: marginContainer),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: (){
          Navigator.pushNamedAndRemoveUntil(
            context, '/home',
            (route) => false,
          );
        }, 
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15), 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(iconData,color: Colors.white,size: 30,),
              Text(text,style: const TextStyle(fontSize: 17,color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}