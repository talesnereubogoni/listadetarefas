// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class ListaDeTarefasPagina1 extends StatefulWidget{
  // como tem variárevis precisa ser do tipo StatefulWidget
  ListaDeTarefasPagina1({Key? key}) : super(key: key);

  @override 
  State<ListaDeTarefasPagina1> createState() => _ListaDeTarefasPagina1State();
}

class _ListaDeTarefasPagina1State extends State<ListaDeTarefasPagina1> {
  List <String> tarefas = []; // cria a lista
  TextEditingController tasksController = TextEditingController();
  // controlador para receber os dados do usuário
   @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: Text('Lista de Tarefas'),
        ),
      
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min, // utiliza a menor altura possível
            children: [
              Row(
                children: [
                  Expanded( // expande para toda a largura
                    flex: 4, // opcional, define o tamanho do campo com relação aos outros componentes da linha
                    child: TextField(
                      controller: tasksController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nova tarefa',
                      ),
                    ),
                  ),
                  SizedBox(width: 8), 
                  Expanded (
                    flex: 1, //tamanho do botão, proporcional ao flex anterior
                    child: ElevatedButton(
                      onPressed: addTask, 
                      style: ElevatedButton.styleFrom(
                        //primary: Colors.cyan, // cores padronizadas do botão
                        primary: Color(0xff58D8B5), // cor em formato hexadecimal
                        padding: EdgeInsets.zero, // espaçamento interno
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14), // espaços para aumentar o tamanho do botão
                        child: Icon( // coloca ícone dentro do botão
                          Icons.add, // nome do ícone
                          size: 30, // tamanho do icone
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Flexible( // limita o tamanho da exibição da lista ao tamanho da tela
                child: ListView.builder(
                  itemCount: tarefas.length,
                  itemBuilder: (context, index) {
                    final tarefa = tarefas[index];
                    return GestureDetector(
                      child: Container(   
                        color: Colors.grey[200],
                        margin: EdgeInsets.symmetric(vertical: 3.0),
                        child: ListTile(
                          title: Text(tarefa), // título 
                        ),
                      ),
                      onTap:() { // executa ao pressionar o botão
                          print('Você clicou no item $tarefa, índice $index');
                        },
                      onDoubleTap: () { // executa ao pressionar o botão
                          setState(() {
                            tarefas.removeAt(index);
                          });
                          print('Você Deletou no item $tarefa, índice $index');
                        },
                    );
                  },
                ),
              ),
              SizedBox(height: 16,),
              Row(
                children: [
                  Expanded(
                    child: Text (
                      "Você possui ${tarefas.length} tarefas pendentes"
                    ),
                  ),
                  SizedBox(width: 8), 
                  ElevatedButton(
                    onPressed: cleanTasks, 
                    child: Text(
                      'Limpar Tarefas'
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addTask(){
    String text = tasksController.text;
    print(text);
    setState(() {
      tarefas.add(text);
    });
  }

  void cleanTasks(){
    setState(() {
      tarefas.clear();
    });
  }

}