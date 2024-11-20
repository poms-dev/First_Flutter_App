
import 'package:first_flutter_app/model/rick_morty_response.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Results character;
  const DetailsScreen({required this.character,super.key });

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      title: "MyApp",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:AppBar(leading:  IconButton(icon:const Icon(Icons.arrow_back),
          onPressed:() { Navigator.pop(context);},),
            title:  const Text('Details Screen')),
        body:    DetailsBody( data: character)
        ,),

    );

  }

}

class DetailsBody extends StatelessWidget {
  final Results data;
  const DetailsBody({required this.data,super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,children: [Image.network(width: 200,height: 200,data.image.toString()),Text(data.name.toString()),Text(data.species.toString()),
          Text(data.status.toString()),Text(data.gender.toString()),Text(data.type.toString())]),
    );
  }
}
