import 'package:flutter/material.dart';
import 'package:first_flutter_app/model/rick_morty_response.dart';


class CharacterCard extends StatelessWidget {

  final Results character;
  const CharacterCard({required this.character,super.key });

  @override
  Widget build(BuildContext context) {
    return  Card(child: Row(children: [ Image.network(width: 100,height: 100,character.image.toString()),Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(character.name.toString()),Text(character.species.toString()),

      ],),],)

    );
  }
}
