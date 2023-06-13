import 'package:flutter/material.dart';
import 'package:page_view_1/presentation/screens/registro_screen.dart';
import 'package:page_view_1/presentation/widgets/commons/button_style_1.dart';
import 'package:page_view_1/presentation/widgets/login/circle_avatar_icon.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          ContainerDecorationCircle(size: size),
          SizedBox(height: size.height * 0.4,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              children: [
                SizedBox(height: size.height * 0.35),
                const _InputDecoration1(hintText: 'Correo Electronico',labelText: 'Correo Electronico',suffixIcon: Icon(null)),
                SizedBox(height: size.height * 0.04,),
                const _InputDecoration1(hintText: 'Contraseña',labelText: 'Contraseña',suffixIcon: Icon(Icons.lock,color: Colors.grey,)),
                SizedBox(height: size.height * 0.03,),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Recuerdame',style: TextStyle(fontSize: 13),),
                      Text('Olvido su Contraseña?',style: TextStyle(fontSize: 13)),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.04,),
                ButtonStyle1(size: size,marginContainer: size.width * 0.15,text: 'Iniciar Sesion',iconData: Icons.login),
                SizedBox(height: size.height * 0.04,),
                const RowCircleAvatar(),
                SizedBox(height: size.height * 0.02,),
                Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'No tiene Cuenta ? ',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400
                ),
              ),
              GestureDetector(
                onTap: (){
                  final route = MaterialPageRoute(
                    builder: (context) => const RegistroScreen()
                  );
                  Navigator.push(context, route);
                },
                child: const Text(
                  ' Sign Up',
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
          ),
        ],
      ),
    );
  }
}

class _InputDecoration1 extends StatelessWidget {
  const _InputDecoration1({
    required this.hintText, 
    required this.labelText, required this.suffixIcon,
  });
  final String hintText;
  final String labelText;
  final Icon suffixIcon;
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        hintText: hintText,
        prefixIcon: const Icon(Icons.email,color: Colors.green,),
        suffixIcon: suffixIcon,
        labelText: labelText
      ),
    );
  }
}

class ContainerDecorationCircle extends StatelessWidget {
  const ContainerDecorationCircle({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(-50, size.height * -0.1),
      child: Container(
        width: size.height * 0.43,
        height: size.height * 0.43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500),
          gradient: LinearGradient(
            colors: [
              Colors.green[300]!,
              Colors.green[600]!
            ]
          )
        ),
        child: Padding(
          padding: EdgeInsets.only(left:50+30,top: size.height * 0.2),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bievenido',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text(
                'Iniciar Sesion!',
                style: TextStyle(
                  fontSize: 34,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}