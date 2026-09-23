import 'package:flutter/material.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart'; //importando da biblioteca de valores de moeda
import 'package:intl/intl.dart'; // importando os dados da biblioteca de data

class AddDinheiro extends StatefulWidget {
  const AddDinheiro({super.key});

  @override
  State<AddDinheiro> createState() => _AddDinheiroState();
}

class _AddDinheiroState extends State<AddDinheiro> {
  //Criação de variaveis
  // variavel de Data
  DateTime?
  _dataSelecionada; //guarda a data em formata de codigo (ex: 2026-09-23).

  // locais para informaçoes
  final _descricao = TextEditingController(); //add variaveis
  final _valor = TextEditingController(); // add Variaveis

  //final _data = TextEditingController(); // add Variaveis de data
  final TextEditingController _data =
      TextEditingController(); // add a data formatada

  // Data
  Future<void> _selecionarData(BuildContext context) async {
    // abre o calendario e e formata a resposta
    final DateTime? escolhida = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), //abre no dia de hoje
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      locale: const Locale('pt', 'PT'),
    );
    if (escolhida != null && escolhida != _dataSelecionada) {
      //verifica se a data foi mesmo escolhida
      setState(() {
        _dataSelecionada = escolhida;
        DateFormat formatador = DateFormat('dd/MM/yyyy', 'pt_PT');
        _data.text = formatador.format(escolhida);
      });
    }
  }
  //final _categoria = TextEditingController();

  //Formataçao da variavel de valor
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
      'valor': _formatter, // Convertendo o valor para string
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
              //
              TextField(
                controller: _data, //chamando a variavel
                readOnly: true, //Impede que o usuario escreva
                decoration: const InputDecoration(
                  labelText: 'Data da transação',
                  hintText: 'Selecione uma data',
                  suffixIcon: Icon(Icons.calendar_today), //iconi de calendario
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                onTap: () => _selecionarData(context),
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
