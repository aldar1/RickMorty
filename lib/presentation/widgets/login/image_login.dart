import 'package:flutter/material.dart';
import 'package:page_view_1/presentation/providers/theme_provider.dart';
import 'package:provider/provider.dart';


class ImageLogin extends StatelessWidget {
  const ImageLogin({super.key, 
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final providerTheme = Provider.of<ThemeProvider>(context);
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.33,
      // color: Colors.red,
      child: Stack(
        children: [
          Image(
            height: size.height * 0.30,
            width: double.infinity,
            // image: const AssetImage('assets/login/light_login.png',),
            image: providerTheme.isdarktheme ? const AssetImage('assets/login/login2.gif',) : const AssetImage('assets/login/light_login.png',),
          ),
          Positioned(
            top: size.height * 0.20,
            left: size.width * 0.25,
            child: Image(
              image: const AssetImage('assets/intro/rickmorty.png',),
              height: size.height * 0.15,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
