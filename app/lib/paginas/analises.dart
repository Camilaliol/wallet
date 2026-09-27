import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:app/theme/app_theme.dart';

class Analises extends StatefulWidget {
  // tem alguma variavel ou historio a mostra
  final List<Map<String, dynamic>> historico;

  const Analises({super.key, required this.historico});

  @override
  State<Analises> createState() => _AnalisesState();
}

class _AnalisesState extends State<Analises> {
  DateTime? _mes;
  Map<String, double> _calcularDespesasPorCategoria() {
    Map<String, double> totais = {};

    for (var item in widget.historico) {
      if (item['tipos'] == 'despesa,') {
        // CORRIGIDO: Adicionado o '=' que faltava
        String categoria = item['categoria'] ?? 'Outros';

        // Conversor seguro de texto/número para decimal (double)
        double valor = item['valor'].getDouble();

        // CORRIGIDO: Usando 'totais' (plural) e a variável 'categoria' (sem aspas)
        if (totais.containsKey(categoria)) {
          totais[categoria] =
              totais[categoria]! + valor; // Soma ao valor que já existia
        } else {
          totais[categoria] =
              valor; // Inicia a categoria com o primeiro valor dela
        }
      }
    }
    return totais; // Retorna o mapa calculado ex: {'Alimentação': 45.0, 'Lazer': 12.0}
  }

  // Desenhho do Grafico
  @override
  Widget build(BuildContext contex) {
    final dadosCategorias = _calcularDespesasPorCategoria();

    final List<Color> cores = [
      const Color.fromARGB(255, 214, 44, 14),
      const Color.fromARGB(255, 33, 219, 243),
      const Color.fromARGB(255, 42, 234, 48),
      const Color.fromARGB(255, 237, 13, 222),
      const Color.fromARGB(255, 35, 21, 238),
      const Color.fromARGB(255, 236, 217, 14),
    ];
    int corIndex = 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Análise'),
      ),
      body: Center(
        child: dadosCategorias.isEmpty
            ? const Text(
                "Nenhuma despesa para análisar !",
                style: TextStyle(fontSize: 18),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Distribuição por Categoria",
                      style: TextStyle(
                        fontSize: 40, // aumentando o tamanho da letra
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10), // subindo o texto
                    // A caixa que fica o desenho do grafico
                    SizedBox(
                      height:
                          260, // Reduzido levemente para dar espaço à lista abaixo
                      child: PieChart(
                        PieChartData(
                          centerSpaceRadius: 0,
                          sectionsSpace: 2,
                          sections: dadosCategorias.entries.map((entry) {
                            final corAtual = cores[corIndex % cores.length];
                            corIndex++;

                            return PieChartSectionData(
                              color: corAtual,
                              value: entry.value,
                              // Exibe apenas o valor ou % dentro da pizza para não poluir
                              title: 'R\$${entry.value.toStringAsFixed(0)}',
                              radius: 110,
                              titleStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30), //

                    Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: dadosCategorias.entries.map((entry) {
                          // Reinicia ou busca a cor correspondente para a legenda bater com a pizza

                          final index = dadosCategorias.keys.toList().indexOf(
                            entry.key,
                          );
                          final corCategoria = cores[index % cores.length];

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Row(
                              children: [
                                // Quadradinho colorido da categoria
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: corCategoria,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                // Nome da Categoria
                                Text(
                                  entry.key,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Spacer(), // Empurra o valor para a direita
                                // Valor Total da Categoria
                                Text(
                                  "R\$ ${entry.value.toStringAsFixed(2)}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ], // Fim dos filhos da Column principal
                ),
              ),
      ),
    );
  }
}
