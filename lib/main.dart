import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_view_1/presentation/providers/rick_and_morty_provider.dart';
import 'package:page_view_1/presentation/providers/theme_provider.dart';
import 'package:page_view_1/presentation/screens/home_screen.dart';
import 'package:page_view_1/presentation/screens/intro_screen.dart';
import 'package:page_view_1/presentation/screens/registro_screen.dart';
import 'package:page_view_1/presentation/screens/signin_screen.dart';
import 'package:page_view_1/presentation/screens/signup_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RickAndMortyProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider())
      ],
      
      child: Builder(
        builder: (context) {
          final changeTheme = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'Material App',
            debugShowCheckedModeBanner: false,
            
            theme: changeTheme.isdarktheme ? ThemeData.dark(useMaterial3: true) : ThemeData(useMaterial3: true,colorSchemeSeed: Colors.green),
            // home: const IntroScreen(),
            initialRoute: '/intro',
            routes: {
              '/intro' : (context) => const IntroScreen(),
              '/registro' : (context) => const RegistroScreen(),
              '/signin' : (context) => const SigninScreen(),
              '/signup' : (context) => const SignupScreen(),
              '/home' : (context) => const HomeScreen(),
            },
          );
        }
      ),
    );
  }
}