import 'package:first_flutter_app/model/rick_morty_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class RickMortyApi{
  final url = 'https://rickandmortyapi.com/api/character';

  Future<RickMortyResponse> fetchRickAndMortyResponse([int page = 1]) async {
    final response = await http
        .get(Uri.parse('$url/?page = $page'));

    if (response.statusCode == 200) {

      return RickMortyResponse.fromJson(convert.jsonDecode(response.body) as Map<String, dynamic>);
    } else {

      throw Exception('Failed to load album');
    }
  }

}


