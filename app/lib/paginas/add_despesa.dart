import 'package:flutter/material.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart'; //importando o pacote de formatação de valor
import 'package:intl/intl.dart';

class AddDespesa extends StatefulWidget {
  const AddDespesa({super.key});

  @override
  State<AddDespesa> createState() => _AddDespesaState();
}

class _AddDespesaState extends State<AddDespesa> {
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

  // add Variaveis
  final _categoria = TextEditingController();

  //add variaveis
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

      'valor': _formatter,

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
