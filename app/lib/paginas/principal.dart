import 'package:app/paginas/add_dinheiro.dart';
import 'package:flutter/material.dart';
import 'package:app/paginas/add_despesa.dart';

class Principal extends StatefulWidget {
  const Principal({super.key, required this.title});

  final String title;

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final List<Map<String, dynamic>> _historico = [
    {
      'descricao': "salario",
      'data': "27/09/2026",
      'valor': "2000",
      'categoria': "salario",
    },
  ]; //criando uma lista

  double _saldo = 0; // mariavel que vai receber o valor do saldo, double é o tipo de variavel para mais de um numero decimal

  
  void _abrirAddDinheiro() async {
    final deposito = await Navigator.push(
      // comando que navega entre as paginas
      context,
      MaterialPageRoute(builder: (context) => const AddDinheiro()),
    );

    if (deposito != null) {
      //verifica se o valor não esta vasio
      setState(() {
        _historico.add(deposito);
      });

      setState(() {
        _saldo += int.tryParse(deposito['valor']) ?? 0;
      });
    }
  }

  void _abrirAddDespesa() async {
    final deposito = await Navigator.push(
      // comando que navega entre as paginas
      context,
      MaterialPageRoute(builder: (context) => const AddDespesa()),
    );

    if (deposito != null) {
      //verifica se o valor não esta vasio
      setState(() {
        _historico.add(deposito);
      });

      setState(() {
        _saldo -= int.tryParse(deposito['valor']) ?? 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //var newVariable =0; neste momento não esta sendo chamada a variavel newVariable, por isso esta comentada
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
                  onPressed: _abrirAddDinheiro,
                  child: const Text("Add dinheiro"),
                ),
                TextButton(
                  onPressed: _abrirAddDespesa,
                  child: const Text("Add despesa"),
                ),
                Text("Análises"),
              ],

            ),
                
            
            Expanded( 
              child: ListView.builder(
                itemCount: _historico.length,
                itemBuilder: (context, index) {
                  final item = _historico[index];
                  String valorMostrar;
                  if (item['tipos'] == 'despesa,') {
                    valorMostrar = "-€${item['valor']}";
                  } else {
                    valorMostrar = "+€${item['valorNumerico']}";
                  }

                  return ListTile(
                    title: Text(
                      " ${item['data']}     ${item['categoria']}   $valorMostrar",
                    ),
                  );
                },
              ),
            ),
          ], // Fecha o children da Column
        ), // Fecha a Column
      ), // Fecha o Center
    ); // Fecha o Scaffold e o return
  } // Fecha o método build (Sem ponto e vírgula)
} // Fecha a classe _PrincipalState (Sem ponto e vírgula)