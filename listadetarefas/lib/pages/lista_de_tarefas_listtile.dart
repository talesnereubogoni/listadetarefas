// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, deprecated_member_use, avoid_print

import 'package:flutter/material.dart';

class ListaDeTarefasPagina1 extends StatelessWidget {
  ListaDeTarefasPagina1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16), // espaços laterais
          child: Column(
            mainAxisSize: MainAxisSize.min, // utiliza a menor altura possível
            children: [
              Row(
                children: [
                  Expanded(
                    // expande para toda a largura
                    flex:
                        4, // opcional, define o tamanho do campo com relação aos outros componentes da linha
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nova tarefa',
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    flex: 1, //tamanho do botão, proporcional ao flex anterior
                    child: ElevatedButton(
                      onPressed: addTask,
                      style: ElevatedButton.styleFrom(
                        //primary: Colors.cyan, // cores padronizadas do botão
                        primary:
                            Color(0xff58D8B5), // cor em formato hexadecimal
                        padding: EdgeInsets.zero, // espaçamento interno
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(
                            14), // espaços para aumentar o tamanho do botão
                        child: Icon(
                          // coloca ícone dentro do botão
                          Icons.add, // nome do ícone
                          size: 30, // tamanho do icone
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ListView(
                shrinkWrap:
                    true, // altera automaticamente o tamanho de exibição da lista
                children: [
                  ListTile(
                      title: Text('Tarefa 1'), // título
                      subtitle: Text('25/05/2023'), // subtítulo
                      leading: Icon(
                        Icons.save,
                        size: 30,
                      ), // lado esquerdo
                      onTap: () {
                        // executa ao pressionar o botão
                        print('tarefa 1');
                      }),
                  ListTile(
                      title: Text('Tarefa 2'), // título
                      subtitle: Text('27/05/2023'), // subtítulo
                      leading: Icon(
                        Icons.accessibility,
                        size: 30,
                      ), // lado esquerdo
                      onTap: () {
                        // executa ao pressionar o botão
                        print('tarefa 2');
                      }),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text("Você possui 0 tarefas pendentes"),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: cleanTasks,
                    child: Text('Limpar Tarefas'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addTask() {}

  void cleanTasks() {}
}
