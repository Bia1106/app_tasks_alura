import 'package:app_tasks_alura/components/task.dart';
import 'package:app_tasks_alura/data/task_inhetited.dart';
import 'package:app_tasks_alura/screens/task_form.dart';
import 'package:flutter/material.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  bool opacity = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text(
          'Tasks',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: SizedBox(
                  width: 200,
                  child: LinearProgressIndicator(
                    color: Colors.white,
                    value: 1,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Text(
                  'Teste',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => debugPrint('Clicked'),
                child: const Icon(
                  Icons.refresh,
                  size: 26.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
      body: AnimatedOpacity(
        //se torna desnecessário quando as linhas 53 a 58 estão comentadas porém pretendo utilizar mais tarde com outro botão
        opacity: opacity ? 1 : 0,
        duration: const Duration(milliseconds: 2000),
        child: ListView(
          padding: const EdgeInsets.only(top: 8, bottom: 70),
          children: TaskInherited.of(context)!.taskList,
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => setState(() => opacity = !opacity),
      //   child: const Icon(
      //     Icons.remove_red_eye,
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => Navigator.pushNamed(context, '/form'), formas mais dinâmica
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (contextNew) => TaskForm(
                      // nesse caso diferecia-se esse context para mostrar que está sendo buildado um contexto novo e como precisamos do contexto que vem de fora, o contexto da lista
                      // muda-se o nome da variável pra ficar mais fácil a visualização de que o contexto passado para o TaskForm é o de Tasks e não o dele mesmo
                      //(que é novo e não) contém as informações que precisamos
                      taskContext: context,
                    ))),
        child: const Icon(
          Icons.add_task,
        ),
      ),
    );
  }
}
