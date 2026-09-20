import 'package:app/paginas/add_dinheiro.dart';
import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({super.key, required this.title});

  final String title;

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int _saldo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          spacing: 250,
          children: [
            Text("€$_saldo", style: TextStyle(fontSize: 24)),
            Row(
              spacing: 40, // espaçamento do texto
              mainAxisAlignment:
                  MainAxisAlignment.center, // centralizando o texto
              children: [
                // adicionando textos para os futuros botoes
                TextButton(
                  child: const Text("Add dinheiro"),
                  onPressed: () {
                    Navigator.push(
                      // comando que navega entre as paginas
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddDinheiro(),
                      ),
                    );
                  },
                ),
                Text("Add despesas"),
                Text("Análises"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
