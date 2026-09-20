import 'package:flutter/material.dart';

class AddDinheiro extends StatefulWidget {
  const AddDinheiro({super.key});

  @override
  State<AddDinheiro> createState() => _AddDinheiroState();
}

class _AddDinheiroState extends State<AddDinheiro> {
  int _saldo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Add Dinheiro"),
      ),
      body: Center(
        child: SizedBox(
          width: 450, // tamanho da coluna
          child: Column(
            // é preciso add o child para mudar a altura
            mainAxisAlignment: .center,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  labelText: 'Descrição',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  labelText: 'Valor',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  labelText: 'Data',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  labelText: 'Categoria',
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Salvar"),
              ), // botao de salvar os dados de dinheiro
            ],
          ),
        ),
      ),
    );
  }
}
