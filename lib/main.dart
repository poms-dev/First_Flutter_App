import 'package:first_flutter_app/api/rick_morthy_api.dart';
import 'package:first_flutter_app/details_screen.dart';
import 'package:first_flutter_app/model/rick_morty_response.dart';
import 'package:first_flutter_app/widget/character_card.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MyApp",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Rick&Morty Application')),
        body: const ListScreen(),
      ),
    );
  }
}

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  ScrollController? scrollController;
  int page = 1;
  int listSize = 0;
  bool isLoading = false;
  final List<Results> list = [];
  // final Future<RickMortyResponse> future = RickMortyApi().fetchRickAndMortyResponse();

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController?.addListener(() {
      fetchMoreData();
    });
    fetchData();
  }

  @override
  void dispose() {
    scrollController?.dispose();
    super.dispose();
  }

  void fetchData() {
    setState(() {
      isLoading = true;
    });

    RickMortyApi().fetchRickAndMortyResponse(page).then((value) {
      page++;
      setState(() {
        isLoading = false;
        list.addAll(value.results as Iterable<Results>);
        listSize = list.length;
      });
    });
  }

  void fetchMoreData() {
    if (scrollController?.position.pixels ==
        scrollController?.position.maxScrollExtent) {
      RickMortyApi().fetchRickAndMortyResponse(page).then((value) {
        setState(() {
          list.addAll(value.results as Iterable<Results>);
          listSize = list.length;
          page++;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoading
          ? const CircularProgressIndicator()
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    _navigateToDetails(list[index]);
                  },
                  child: CharacterCard(
                    character: list[index],
                  ),
                );
                // return CharacterCard(character:list[index]);
                //  return ElevatedButton(onPressed:(){} , child: Text('Click'));
              }),
    );
  }

  _navigateToDetails(Results character) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DetailsScreen(character: character)));
  }
}
