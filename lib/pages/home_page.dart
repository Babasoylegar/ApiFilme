import 'dart:async';
import 'package:apifilme/models/filme.dart';
import 'package:apifilme/services/omdb_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

final TextEditingController controller = TextEditingController();

final Omdbservice service = Omdbservice();

List<Filme> filmes = [];

bool carregando = false;

Future<void> pesquisar() async {
  setState(() {
    carregando = true;
  });
  filmes = await service.buscarFilmes(controller.text,
  );
  setState(() {
    carregando = false;
  });
}

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}