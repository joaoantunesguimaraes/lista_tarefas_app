import 'package:flutter/material.dart';
import 'package:lista_tarefas_app/tarefa.dart';

void main() {
  //runApp(const ListaTarefasApp());
  runApp(ListaTarefasApp());
}

class ListaTarefasApp extends StatelessWidget {
  const ListaTarefasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'TodoList App', home: ListaScreen());
  }
}

class ListaScreen extends StatefulWidget {
  const ListaScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListaScreenState();
  }
}

class ListaScreenState extends State<ListaScreen> {
  //List<Tarefa> tarefas = new List<Tarefa>();
  List<Tarefa> tarefas = <Tarefa>[];
  TextEditingController controller = new TextEditingController();

  void adicionaTarefa(String nome) {
    setState(() {
      tarefas.add(Tarefa(nome));
    });

    controller.clear();
  }

  Widget getItem(Tarefa tarefa) {
    return Row(children: [
      IconButton(
        icon: Icon(
          tarefa.concluida ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.green,
        ),
        iconSize: 42.0,
        onPressed: () {
          setState(() {
            //tarefa.concluida = true;
            tarefa.concluida = !tarefa.concluida;
          });
        },
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            tarefa.nome,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Text(tarefa.data.toIso8601String())
        ],
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Tarefas")),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                onSubmitted: (value) {
                  adicionaTarefa(value);
                },
              )),
          Expanded(
              child: ListView.builder(
            itemCount: tarefas.length,
            itemBuilder: (_, indice) {
              return getItem(tarefas[indice]);
            },
          ))
        ],
      ),
    );
  }
}
