import 'package:flutter/material.dart';
import 'package:page_view_1/presentation/providers/rick_and_morty_provider.dart';


class ListCharacter extends StatelessWidget {
  const ListCharacter({super.key, 
    required this.providerListRickMorty,
  });

  final RickAndMortyProvider providerListRickMorty;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        itemCount: providerListRickMorty.getListRickMorty.length,
        itemBuilder: (context,index){
          final rickMorty = providerListRickMorty.getListRickMorty[index];
          return Column(
            children: [
              Card(
                elevation: 10,
                clipBehavior: Clip.antiAlias,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text(
                              rickMorty.name,
                              style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(rickMorty.status.name),
                              const SizedBox(width: 10,),
                              Container(
                                decoration: BoxDecoration(
                                  color: rickMorty.status.name.contains('ALIVE') ? Colors.green :Colors.red,
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                width: 10,
                                height: 10,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                rickMorty.species.name
                              ),
                              const SizedBox(width: 10,),
                              Icon(
                                rickMorty.species.name.contains('HUMAN') 
                                ? Icons.accessibility_new_sharp 
                                : Icons.all_inclusive,
                                color: Colors.black,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 120,
                            child: Text(
                              rickMorty.location.name,
                              style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FadeInImage(
                      placeholder: const AssetImage('assets/loading/loadingPortal.gif'),
                      image: NetworkImage(rickMorty.image),
                      width: 100,
                      height: 150,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              ),
            ],
          );
        },
      )
    );
  }
}