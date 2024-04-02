import 'package:flutter/material.dart';
import 'components/input/input.dart';
import 'components/button/button.dart';
import 'components/slider/slider.dart';
import 'components/radio/radio_list.dart';
import 'components/switch/switch_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Crie sua conta',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Crie sua conta'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  _MyHomePageState();

  String? genero = "";
  bool notifyEmail = false;
  bool notifyCelular = false;
  double font = 14;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: const Drawer(),
      body: Container(
        color: Colors.grey[100],
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const InputTextField(label: "Nome", maxLength: 20),
              const InputTextField(label: "Data de Nascimento", maxLength: 10),
              const InputTextField(label: "E-mail", maxLength: 70),
              const InputTextField(label: "Senha", isPassword: true, maxLength: 20),
              ListRadio(title: "Gênero:", value: genero, onChanged: (String? value) => setState(() => genero = value)),
              ListSwitch(
                title: "Notificações:",
                label1: 'E-mail', value1: notifyEmail, onChanged1: (bool value) => setState(() => notifyEmail = value),
                label2: 'Celular', value2: notifyCelular, onChanged2: (bool value) => setState(() => notifyCelular = value),
              ),
              const Button(title: "Registrar"),
              SliderDouble(title: "Tamanho da fonte:", value: font, min: 10, max: 30, divisions: 10, onChanged: (double value) => setState(() => font = value)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Login"),
        ],
      ),
    );
  }
}