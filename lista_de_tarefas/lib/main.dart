import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  // Lista de tarefas
  List<String> _todos = [];

  // Controlador para o campo de texto
  final TextEditingController _controller = TextEditingController();

  // Método para adicionar uma nova tarefa
  void _addTodo() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _todos.add(_controller.text);
      });
      _controller.clear();
    }
  }

  // Método para remover uma tarefa
  void _removeTodoAt(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo de texto para adicionar nova tarefa
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Nova tarefa',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // Botão para adicionar tarefa
            ElevatedButton(
              onPressed: _addTodo,
              child: Text('Adicionar tarefa'),
            ),
            SizedBox(height: 20),
            // Lista de tarefas
            Expanded(
              child: ListView.builder(
                itemCount: _todos.length,
                itemBuilder: (context, index) {
                  return Card(
                    key:
                        UniqueKey(), // Aqui usamos uma UniqueKey para garantir que cada Card seja único
                    child: ListTile(
                      title: Text(_todos[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _removeTodoAt(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
