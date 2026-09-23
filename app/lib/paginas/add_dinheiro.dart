import 'package:flutter/material.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

class AddDinheiro extends StatefulWidget {
  const AddDinheiro({super.key});

  @override
  State<AddDinheiro> createState() => _AddDinheiroState();
}

class _AddDinheiroState extends State<AddDinheiro> {
  // Adicionar variaveis
  final _descricao = TextEditingController(); //add variaveis
  final _valor = TextEditingController(); // add Variaveis
  final _data = TextEditingController(); // add Variaveis
  //final _categoria = TextEditingController();
  final _formatter = CurrencyTextInputFormatter.currency(
    locale: 'pt_pt',
    symbol: '€',
    decimalDigits: 2,
  ); //add variaveis

  void _salvar() {
    //uma função que não retorna nada ou seja sem valor
    final Map<String, dynamic> deposito = {
      //local onde as variaveis estao sendo agrupadas para criaçao de uma lista
      'descricao': _descricao.text,
      'valor': _formatter.getDouble(), // Convertendo o valor para string
      'data': _data.text,
      //'categoria': _categoria.text,
      'tipos': 'deposito,',
    };

    Navigator.pop(context, deposito);
  }

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
                controller: _descricao, //chamndo a variavel
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  labelText: 'Descrição',
                ),
              ),
              TextField(
                // chamando a variavel
                controller: _valor,
                keyboardType:
                    TextInputType.number, // Este finha abre o teclado numerico
                inputFormatters: [
                  _formatter,
                ], // Este finha formata o valor para moeda
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  labelText: 'Valor',
                  hintText:
                      '€ 0,00', // Este mostra o valor para dar exemplo ao utilizador
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
              //TextField(
              //controller: _categoria, //chamando a variavel
              //decoration: InputDecoration(
              //border: OutlineInputBorder(
              //borderRadius: BorderRadius.all(Radius.circular(15)),
              //),
              //labelText: 'Categoria',
              //),
              //),
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
