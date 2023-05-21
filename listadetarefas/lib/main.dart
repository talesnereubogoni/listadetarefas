import 'package:flutter/material.dart';
import 'package:listadetarefas/pages/lista_de_tarefas_pagina1.dart';

void main() {
	runApp(const MyApp());
}

class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key: key);
	// This widget is the root of your application.
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
      //debugShowCheckedModeBanner: false,
			home: ListaDeTarefasPagina1(),
		);
	}
}

