

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:page_view_1/presentation/providers/rick_and_morty_provider.dart';
import 'package:page_view_1/presentation/widgets/home_widget/drawer_information.dart';
import 'package:page_view_1/presentation/widgets/home_widget/list_character.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final providerListRickMorty = context.watch<RickAndMortyProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick y Morty'),
      ),
      drawer: DrawerInformation(providerListRickMorty: providerListRickMorty),
      body: Column(
        children: [
          _CardSwiperImages(size: size, providerListRickMorty: providerListRickMorty),
          // const SizedBox(height: 30,),
          ListCharacter(providerListRickMorty: providerListRickMorty)
        ],
      ),
    );
  }
}

class _CardSwiperImages extends StatelessWidget {
  const _CardSwiperImages({
    required this.size,
    required this.providerListRickMorty,
  });

  final Size size;
  final RickAndMortyProvider providerListRickMorty;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey,
      margin: const EdgeInsets.only(bottom: 10),
      width: size.width * 1,
      height: size.height * 0.35,
      child: Column(
        children: [
          Swiper(
            itemCount: providerListRickMorty.getListRickMorty2.length,
            itemWidth: size.width * 0.70,
            itemHeight: size.height * 0.35,
            // viewportFraction: 0.6,
            curve: Curves.easeInOutCubic,
            layout: SwiperLayout.STACK,
            itemBuilder: (context,index){
              final rickMorty = providerListRickMorty.getListRickMorty2[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/loading/loadingPortal.gif'), 
                  image: NetworkImage(rickMorty.image),
                  fit: BoxFit.cover,
                  // fit: BoxFit.fill,
                ),
              );
            },
            // control: SwiperControl(),
          ),
        ],
      ),
    );
  }
}
