import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_view_1/presentation/providers/rick_and_morty_provider.dart';
import 'package:page_view_1/presentation/providers/theme_provider.dart';
import 'package:provider/provider.dart';



class DrawerInformation extends StatelessWidget {
  const DrawerInformation({
    super.key,
    required this.providerListRickMorty,
  });
  final RickAndMortyProvider providerListRickMorty;

  @override
  Widget build(BuildContext context) {
    final changeTheme = Provider.of<ThemeProvider>(context);
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              Center(
                child: CircleAvatar(
                  maxRadius: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(providerListRickMorty.getListRickMorty[0].image),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              const Text('Alfredo Adolfo Alvarez',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              const Text('aalvarez@gmail.com',style: TextStyle(fontSize: 14),),
              const SizedBox(height: 10,),
              const Divider(),
              const ListTileDrawer(text: 'Profile',icon: Icons.account_box_rounded,),
              const ListTileDrawer(text: 'Mensajes',icon: Icons.email,),
              const ListTileDrawer(text: 'Actividades',icon: Icons.addchart_rounded,),
              const ListTileDrawer(text: 'Lista',icon: Icons.list,),
              const ListTileDrawer(text: 'Reportes',icon: Icons.list_alt,),
              ListTile(
                leading: Switch(
                  value: changeTheme.isdarktheme, 
                  onChanged: (onChanged){
                    changeTheme.isdarktheme = onChanged;
                  }
                ),
                title: const Text('Modo Oscuro'),
                iconColor: Theme.of(context).primaryColor.withOpacity(0.8),
                
              ),
              ListTile(
                leading: const Icon(Icons.undo_outlined),
                title: const Text('Cerrar Sesion'),
                iconColor: changeTheme.isdarktheme ? Colors.white : Theme.of(context).primaryColor.withOpacity(0.8),
                onTap: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(
                    context, 
                    '/registro'
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListTileDrawer extends StatelessWidget {
  const ListTileDrawer({
    super.key, required this.text, required this.icon,
  });
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final changeTheme = Provider.of<ThemeProvider>(context);
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      iconColor: changeTheme.isdarktheme ? Colors.white : Theme.of(context).primaryColor.withOpacity(0.8),
    );
  }
}