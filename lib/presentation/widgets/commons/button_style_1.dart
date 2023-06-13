import 'package:flutter/material.dart';
import 'package:page_view_1/presentation/screens/home_screen.dart';


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
          final route = MaterialPageRoute(builder: (context) => const HomeScreen());
          Navigator.push(context, route);
        }, 
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10), 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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