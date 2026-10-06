import 'package:flutter/material.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart'; //importando o pacote de formatação de valor
import 'package:intl/intl.dart';
import 'package:app/theme/app_theme.dart';

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

  //Add variaveis

  //Criação da lista de Categorias
  final List<String> _listaCategorias = [
    'Alimentação',
    'Transporte',
    'Lazer',
    'Moradia e Contas',
    'Saúde',
    'Educação',
    'Outros',
  ];
  String? _categoriaSelecionada;

  // ETAPA 2: Definindo o valor inicial assim que a tela abre
  @override
  void initState() {
    super.initState();
    // Pegamos a primeira palavra da lista ('Alimentação') e guardamos na seleção
    _categoriaSelecionada = _listaCategorias.first;
  }

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

      'categoria':
          _categoriaSelecionada, // envia para a parte pagina inicial a categoria que foi escolhida

      'tipos': 'despesa,',
    };

    Navigator.pop(context, despesa);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adicione suas Despesa")),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0), // tamanho da coluna
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .stretch, // é preciso add o child para mudar a altura
            children: [
              TextField(
                controller: _descricao, //chamndo a variavel
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(labelText: 'Descrição'),
              ),
              const SizedBox(height: 16),

              TextField(
                controller: _valor,
                keyboardType: TextInputType.number, // chamando a variavel
                inputFormatters: [_formatter],
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(labelText: 'Valor'),
              ),
              const SizedBox(height: 16),

              TextField(
                controller: _data, //chamando a variavel
                readOnly: true, //Impede que o usuario escreva
                decoration: const InputDecoration(
                  labelText: 'Data da transação',
                  hintText: 'Selecione uma data',
                  suffixIcon: Icon(
                    Icons.calendar_today,
                    color: AppTheme.corCianoNeon,
                  ), //iconi de calendario
                ),
                onTap: () => _selecionarData(context),
              ),
              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                // Diz para o Flutter qual categoria deve aparecer desenhada primeiro
                value: _categoriaSelecionada,
                dropdownColor: const Color(
                  0xFF161035,
                ), // coloca o fundo do menu
                style: const TextStyle(color: Colors.white, fontSize: 16),
                decoration: const InputDecoration(
                  // Configura a borda arredondada e o texto igual ao seu TextField antigo
                  labelText: 'Categoria',
                ),
                items: _listaCategorias.map(
                  (String textoDaCategoria) {
                    return DropdownMenuItem<String>(
                      value: textoDaCategoria,
                      child: Text(textoDaCategoria),
                    );
                  },
                ).toList(), // Ele fecha a entrada de opções que ja estao prontas
                //Onchanged ele roda toda vez que é escolida uma nova opção diferenre
                onChanged: (String? novaOpcaoClicada) {
                  setState(() {
                    _categoriaSelecionada = novaOpcaoClicada;
                  });
                },
              ),
              const SizedBox(height: 40), // espaço entre o botão de ação

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
