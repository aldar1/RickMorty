import 'package:flutter/material.dart';
import 'package:page_view_1/presentation/widgets/commons/button_style_1.dart';
import 'package:page_view_1/presentation/widgets/login/circle_avatar_icon.dart';


class RegistroScreen extends StatelessWidget {
  const RegistroScreen({super.key});

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
                SizedBox(height: size.height * 0.30),
                const _InputDecoration1(hintText: 'Usuario',labelText: 'Usuario',prefixIcon: Icons.account_circle,suffixIcon: Icon(null,color: Colors.grey,)),
                SizedBox(height: size.height * 0.03,),
                const _InputDecoration1(hintText: 'Correo Electronico',prefixIcon: Icons.email,labelText: 'Correo Electronico',suffixIcon: Icon(null)),
                SizedBox(height: size.height * 0.03,),
                const _InputDecoration1(hintText: 'Contraseña',labelText: 'Contraseña',prefixIcon: Icons.lock_clock,suffixIcon: Icon(Icons.lock,color: Colors.grey,)),
                SizedBox(height: size.height * 0.03,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.check_box_outline_blank),
                      SizedBox(width: size.width * 0.04,),
                      const Text('Acepto la política y los términos',style: TextStyle(fontSize: 13),),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.03,),
                ButtonStyle1(size: size,marginContainer: size.width * 0.15,text: 'Registrarse',iconData: Icons.accessibility),
                SizedBox(height: size.height * 0.03,),
                const RowCircleAvatar(),
                SizedBox(height: size.height * 0.01,),
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
    required this.labelText, 
    required this.suffixIcon, 
    required this.prefixIcon,
  });
  final String hintText;
  final String labelText;
  final Icon suffixIcon;
  final IconData prefixIcon;
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        hintText: hintText,
        prefixIcon: Icon(prefixIcon,color: Colors.green,),
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
                'Hola',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text(
                'Registrarse!',
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