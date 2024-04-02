import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const double fontSize = 14;

    return MaterialApp(
      title: 'Crie sua conta',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: fontSize),
          bodyMedium: TextStyle(fontSize: fontSize),
          bodySmall: TextStyle(fontSize: fontSize),
          labelLarge: TextStyle(fontSize: fontSize),
          labelSmall: TextStyle(fontSize: fontSize),
        ),
      ),
      home: const MyHomePage(title: 'Crie sua conta', fontSize: fontSize),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.fontSize});

  final String title;
  final double fontSize;

  @override
  State<MyHomePage> createState() => _MyHomePageState(fontSize: fontSize);
}

class _MyHomePageState extends State<MyHomePage> {
  double fontSize;
  
  _MyHomePageState({required this.fontSize});

  String? _generoSelecionado = "";
  bool _notificacoesEmail = false;
  bool _notificacoesCelular = false;


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
                const Text("Gênero:"),
                RadioListTile(
                  title: const Text("Masculino"),
                  value: "M", 
                  groupValue: _generoSelecionado, 
                  onChanged: (String? value) {
                    setState(() {
                      _generoSelecionado = value;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Feminino"),
                  value: "F", 
                  groupValue: _generoSelecionado, 
                  onChanged: (String? value) {
                    setState(() {
                      _generoSelecionado = value;
                    });
                  },
                ),
                const Center(child: Text("Notificações:")),
                SwitchListTile(
                  activeColor: Colors.purple,
                  title: const Text("E-mail:"),
                  value: _notificacoesEmail,
                  onChanged: (bool value) {
                    setState(() {
                      _notificacoesEmail = value;
                    });
                  },
                ),
                SwitchListTile(
                  activeColor: Colors.purple,
                  title: const Text("Celular:"),
                  value: _notificacoesCelular,
                  onChanged: (bool value) {
                    setState(() {
                      _notificacoesCelular = value;
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20.0),
                    ),
                    child: const Text("Registrar"),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    const Text("FontSize:"),
                    Expanded(
                      child: Slider(
                        value: fontSize,
                        min: 10,
                        max: 30,
                        divisions: 10,
                        label: fontSize.toString(),
                        onChanged: (newValue) {
                          setState(() {
                            fontSize = newValue;
                          });
                        },
                      ),
                    ),
                  ],
                ),
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

class InputTextField extends StatefulWidget {
  final String label;
  final bool isPassword;
  final int? maxLength;

  const InputTextField({
    super.key,
    required this.label,
    this.isPassword = false,
    this.maxLength,
  });

  @override
  _InputTextFieldState createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: widget.label,
          border: const OutlineInputBorder(),
          suffixIcon: !widget.isPassword ? null :
            IconButton(
              icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
            )
        ),
        maxLength: widget.maxLength,
        obscureText: widget.isPassword && obscureText,
      ),
    );
  }
}