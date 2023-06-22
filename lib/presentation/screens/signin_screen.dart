import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_view_1/presentation/widgets/commons/check_box_widget.dart';
import 'package:page_view_1/presentation/widgets/login/circle_avatar_icon.dart';


class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {

  TextEditingController userTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const textStyle = TextStyle(fontSize: 13);
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
                // const _InputDecoration1(hintText: 'Correo Electronico',labelText: 'Correo Electronico',suffixIcon: Icon(null),prefixIcon: Icons.email),
                _InputDecoration1(
                  textController: emailTextController,
                  hintText: 'Correo Electronico',
                  labelText: 'Correo Electronico',
                  obscureText: false,
                  prefixIcon: Icons.email,
                  suffixIcon: const Icon(null)
                ),
                SizedBox(height: size.height * 0.04,),
                // const _InputDecoration1(hintText: 'Contraseña',labelText: 'Contraseña',suffixIcon: Icon(Icons.lock,color: Colors.grey,),prefixIcon: Icons.lock),
                _InputDecoration1(
                  textController: passwordTextController,
                  hintText: 'Contraseña',
                  labelText: 'Contraseña',
                  obscureText: true,
                  prefixIcon: Icons.lock_clock,
                  suffixIcon: const Icon(Icons.lock,color: Colors.grey,)
                ),
                SizedBox(height: size.height * 0.02,),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CheckBoxWidget(),
                          Text('Recuerdame',style: textStyle,),
                        ],
                      ),
                      Text('Olvido su Contraseña?',style: textStyle),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.03,),
                ButtonStyle1(
                  textEmail: emailTextController,
                  textPassword: passwordTextController,
                  size: size,
                  marginContainer: size.width * 0.15,
                  text: 'Iniciar Sesion',
                  iconData: Icons.login
                ),
                SizedBox(height: size.height * 0.03,),
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
                        Navigator.pushReplacementNamed(context, '/signup');
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
class ButtonStyle1 extends StatelessWidget {
  const ButtonStyle1({
    super.key,
    required this.size, 
    required this.marginContainer, 
    required this.text, 
    required this.iconData, 
    required this.textEmail, 
    required this.textPassword,
  });

  final Size size;
  final double marginContainer;
  final String text;
  final IconData iconData;
  final TextEditingController textEmail;
  final TextEditingController textPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: marginContainer),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: (){
          FirebaseAuth.instance.signInWithEmailAndPassword(
            email: textEmail.text, 
            password: textPassword.text
          ).then((value) {
            // print('Se creo un Nuevo Usuario');
            Navigator.pushNamedAndRemoveUntil(
              context, '/home',
              (route) => false,
            );
          }).onError((error, stackTrace) {
            // print('Error ${error.toString()}');
          });
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



class _InputDecoration1 extends StatelessWidget {
  const _InputDecoration1({
    required this.hintText, 
    required this.labelText, 
    required this.suffixIcon, 
    required this.prefixIcon,
    required this.textController,
    required this.obscureText
  });
  final String hintText;
  final String labelText;
  final Icon suffixIcon;
  final IconData prefixIcon;
  final TextEditingController textController;
  final bool obscureText;
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      obscureText: obscureText,
      enableSuggestions: !obscureText,
      autocorrect: !obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        hintText: hintText,
        prefixIcon: Icon(prefixIcon,color: Colors.green,),
        suffixIcon: suffixIcon,
        labelText: labelText
      ),
      keyboardType: obscureText ? TextInputType.visiblePassword : TextInputType.emailAddress,
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