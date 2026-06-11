import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/filme.dart';

class Omdbservice {
  //final string apikey = 'SUA_CHAVE'
  final String apikey = 'e539c6c2';

  Future<List<Filme>> buscarFilmes(String nomeFilme) async {
    List<Filme> listarFilmes = [];

    final urlBusca = 'http://www.omdbapi.com/?s=$nomeFilme&apikey=$apikey';

    final responseBusca = await http.get(Uri.parse(urlBusca));

    final dadosBusca = json.decode(responseBusca.body);

    if (dadosBusca['Search'] != null) {
      for (var item in dadosBusca['Search']) {
        final imdbID = item['imdbID'];
        final urlDetalhes =
            'https://www.omdbapi/?i=$imdbID&plot=short&apikey=$apikey';
        final responsedetalhes = await http.get(Uri.parse(urlDetalhes));
        final dadosDetalhes = json.decode(responsedetalhes.body);
        listarFilmes.add(Filme.fromJson(dadosDetalhes));
      }
    }
    return listarFilmes;
  }
}
