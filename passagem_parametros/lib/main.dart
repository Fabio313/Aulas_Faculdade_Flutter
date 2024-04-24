import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela de login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Inicial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _userController,
              decoration: InputDecoration(
                hintText: 'Usuario',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Senha',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      user: _userController.text,
                      password: _passwordController.text,
                    ),
                  ),
                );
              },
              child: Text('Acessar'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatefulWidget {
  final String user;
  final String password;

  DetailScreen({required this.user, required this.password});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String message = "";

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      final response = await http.post(
        Uri.parse("https://localhost:7130/api/v1/login"),
        body: json.encode({'user': widget.user, 'password': widget.password}),
        headers: {'Content-Type': 'application/json'},
      );
      final responseData = json.decode(response.body);

      setState(() {
        if (response.statusCode == 200 && responseData) {
          message = "Logado com sucesso!";
        } else {
          message = "Erro de login!";
        }
      });
    } catch (e) {
      setState(() {
        message = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Detalhes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Dados recebidos:'),
            Text(
              widget.user + '|' + widget.password,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              message,
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
