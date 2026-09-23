import 'package:flutter/material.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart'; //importando o pacote de formatação de valor

class AddDespesa extends StatefulWidget {
  const AddDespesa({super.key});

  @override
  State<AddDespesa> createState() => _AddDespesaState();
}

class _AddDespesaState extends State<AddDespesa> {
  // Adicionar variaveis
  final _descricao = TextEditingController(); //add variaveis
  final _valor = TextEditingController(); // add Variaveis
  final _data = TextEditingController(); // add Variaveis
  final _categoria = TextEditingController(); //add variaveis
  final _formatter = CurrencyTextInputFormatter.currency(
    // add variavel de formato de tipo de dinheiro
    locale: 'pt_pt', // a localidade que estamos
    symbol: '€', // simbolo que vai aparecer no valor
    decimalDigits: 2, // numero de casas decimais
  );

  void _salvar() {
    //uma função que não retorna nada ou seja sem valor
    final Map<String, dynamic> despesa = {
      //local onde as variaveis estao sendo agrupadas para criaçao de uma lista
      'descricao': _descricao.text,
      'valor': _formatter.getDouble(),
      'data': _data.text,
      'categoria': _categoria.text,
      'tipos': 'despesa,',
    };

    Navigator.pop(context, despesa);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Add Despesa"),
      ),
      body: Center(
        child: SizedBox(
          width: 450, // tamanho da coluna
          child: Column(
            // é preciso add o child para mudar a altura
            mainAxisAlignment: .center,
            children: [
              TextField(
                controller: _descricao, //chamndo a variavel
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  labelText: 'Descrição',
                ),
              ),
              TextField(
                controller: _valor,
                keyboardType: TextInputType.number, // chamando a variavel
                inputFormatters: [_formatter],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  labelText: 'Valor',
                ),
              ),
              TextField(
                controller: _data, //chamando a variavel
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  labelText: 'Data',
                ),
              ),
              TextField(
                controller: _categoria, //chamando a variavel
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  labelText: 'Categoria',
                ),
              ),
              TextButton(
                onPressed: _salvar,
                child: Text("Salvar"),
              ), // botao de salvar os dados de dinheiro
            ],
          ),
        ),
      ),
    );
  }
}
