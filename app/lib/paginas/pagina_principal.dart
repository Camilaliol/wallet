import 'package:flutter/material.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key, required this.title});

  final String title;

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
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
          children: [
            Text("€$_saldo"),
            Row(
              spacing: 40, // espaçamento do texto
              mainAxisAlignment:
                  MainAxisAlignment.center, // centralizando o texto
              children: [
                // adicionando textos para os futuros botoes
                Text("Add dinheiro"),
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
