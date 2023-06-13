import 'package:flutter/material.dart';
import 'package:page_view_1/presentation/screens/login_screen.dart';
import 'package:page_view_1/presentation/widgets/commons/button_style_1.dart';
import 'package:page_view_1/presentation/widgets/login/circle_avatar_icon.dart';
import 'package:page_view_1/presentation/widgets/login/image_login.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: size.height* 0.15,),
          ImageLogin(size: size),
          const Text(
            'Registro',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold
            ),
          ),
          const Text(
            'Una Aventura por vivir',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300
            ),
          ),
          SizedBox(height: size.height * 0.04),
          ButtonStyle1(size: size,marginContainer: size.width * 0.09,text: 'Continuar con Facebook',iconData: Icons.facebook),
          SizedBox(height: size.height * 0.03),
          _ButtonOutline1(size: size),
          SizedBox(height: size.height * 0.03),
          const RowCircleAvatar(),
          SizedBox(height: size.height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Ya tienes una cuenta ? ',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400
                ),
              ),
              GestureDetector(
                onTap: (){
                  final route = MaterialPageRoute(
                    builder: (context) => const LoginScreen()
                  );
                  Navigator.push(context, route);
                },
                child: const Text(
                  ' Login',
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 15,
                    color: Colors.green,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.green
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ButtonOutline1 extends StatelessWidget {
  const _ButtonOutline1({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.14),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(width: 1)
        ),
        onPressed: (){},
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 12), 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Correo electronico o telefono',style: TextStyle(fontSize: 13,color: Colors.black),),
            ],
          ),
        ),
      ),
    );
  }
}











