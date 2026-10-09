import 'package:app/categorias.dart';
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
  Map<String, double> _calcularDespesasPorCategoria() {
    Map<String, double> totais = {};

    for (var item in widget.historico) {
      if (item['tipos'] == 'despesa,') {
        String categoria = item['categoria'] ?? 'Outros';

        double valor =
            item['valor']; // Conversor texto para número para decimal (double)

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
    final cores = AppTheme.coresGrafico; //Puxa a lista de cores pre definidas
    final listaEntradas = dadosCategorias.entries.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Análise')),
      body: Center(
        child: dadosCategorias.isEmpty
            ? const Text(
                "Nenhuma despesa para análisar!",
                style: TextStyle(fontSize: 18, color: Colors.white70),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Distribuição por Categoria",
                        style: TextStyle(
                          fontSize: 26, // aumentando o tamanho da letra
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 15), // subindo o texto
                      // A caixa que fica o desenho do grafico
                      SizedBox(
                        height:
                            240, // Reduzido levemente para dar espaço à lista abaixo
                        child: PieChart(
                          PieChartData(
                            centerSpaceRadius: 0,
                            sectionsSpace: 2,
                            sections: List.generate(listaEntradas.length, (
                              index,
                            ) {
                              final entry = listaEntradas[index];
                              final corAtual = cores[index % cores.length];

                              return PieChartSectionData(
                                color: corAtual,
                                value: entry.value,
                                // Exibe apenas o valor ou % dentro da pizza para não poluir
                                title: 'R\$${entry.value.toStringAsFixed(0)}',
                                radius: 105,
                                titleStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black54,
                                      blurRadius: 3,
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25), //

                      Container(
                        padding: const EdgeInsets.all(14.0),
                        decoration: AppTheme.caixaCustomizada,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: listaEntradas.map((entry) {
                            final index = listaEntradas.indexOf(entry);
                            final corCategoria = cores[index % cores.length];

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Row(
                                children: [
                                  //Círculo Neon com o Ícone da categoria dentro!
                                  Container(
                                    width: 34,
                                    height: 34,
                                    decoration: BoxDecoration(
                                      color: corCategoria.withOpacity(0.15),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      icones[entry.key],
                                      size: 18,
                                      color:
                                          corCategoria, // O ícone brilha na mesma cor da pizza
                                    ),
                                  ),
                                  const SizedBox(width: 12),

                                  // Nome da Categoria
                                  Text(
                                    entry.key,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Spacer(),

                                  // Valor Total da Categoria
                                  Text(
                                    "R\$ ${entry.value.toStringAsFixed(2)}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors
                                          .white, // Modificado para branco para destacar no fundo escuro
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
