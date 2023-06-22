import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_view_1/presentation/providers/theme_provider.dart';
import 'package:page_view_1/presentation/widgets/login/circle_avatar_icon.dart';
import 'package:page_view_1/presentation/widgets/login/image_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class RegistroScreen extends StatelessWidget {
  const RegistroScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: size.height* 0.15,),
          ImageLogin(size: size),
          const Column(
            children: [
              Text(
                'Registro',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2
                ),
              ),
              Text(
                'Una Aventura por vivir',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.04),
          _ButtonStyle1(size: size,marginContainer: size.width * 0.09,text: 'Continuar con Google',iconData: Icons.account_circle,),
          SizedBox(height: size.height * 0.03),
          _ButtonOutline1(size: size),
          SizedBox(height: size.height * 0.03),
          const RowCircleAvatar(),
          SizedBox(height: size.height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Todavia No tienes Cuenta ? ',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/signup');
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
    final providerTheme = Provider.of<ThemeProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.14),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 1,
            color: providerTheme.isdarktheme ?  Colors.white : Colors.black
          )
        ),
        onPressed: (){
          Navigator.pushNamed(
              context, '/signin',
              // (route) => false,
          );
          // Navigator.pushNamed(context, '/signin');
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12), 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Correo electronico o telefono',
                style: TextStyle(
                  fontSize: 13,
                  color: providerTheme.isdarktheme ?  Colors.white : Colors.black
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _ButtonStyle1 extends StatelessWidget {
  const _ButtonStyle1({
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
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    // User? user1;

    loginWithGoogle() async {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      try {
        final UserCredential userCredential = await firebaseAuth.signInWithCredential(authCredential);
        // print(userCredential);
        return userCredential;
      } catch (e) {
        // print(e);
        return null;
      }
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: marginContainer),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () async{
          UserCredential? userCredentialFinal = await loginWithGoogle();
          if(userCredentialFinal != null){
            // ignore: use_build_context_synchronously
            Navigator.pushNamedAndRemoveUntil(
              context, '/home',
              (route) => false,
          );
          }
        }, 
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20), 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Icon(iconData,color: Colors.white,size: 30,),
              Image.asset(
                'assets/logo/logoGoogle1.png',
                width: 30,
                height: 30,
              ),
              Text(text,style: const TextStyle(fontSize: 17,color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}









