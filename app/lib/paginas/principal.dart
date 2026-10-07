import 'package:app/paginas/add_dinheiro.dart';
import 'package:app/paginas/analises.dart';
import 'package:flutter/material.dart';
import 'package:app/paginas/add_despesa.dart';
import 'package:app/theme/app_theme.dart';
import 'dart:ui';

class Principal extends StatefulWidget {
  const Principal({super.key, required this.title});

  final String title;

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final List<Map<String, dynamic>> _historico = [];

  double _saldo = 0;

  void _abrirAddDinheiro() async {
    final deposito = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddDinheiro()),
    );

    if (deposito != null) {
      setState(() {
        _historico.add(deposito);
      });

      setState(() {
        _saldo += deposito['valor'].getDouble();
      });
    }
  }

  void _abrirAddDespesa() async {
    final deposito = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddDespesa()),
    );

    if (deposito != null) {
      setState(() {
        _historico.add(deposito);
      });

      setState(() {
        _saldo -= deposito['valor'].getDouble();
      });
    }
  }

  void _removerItem(int index) {
    setState(() {
      final itemRemovido = _historico[index];
      double valorDinheiro = itemRemovido['valor'].getDouble();

      if (itemRemovido['tipos'] == 'despesa,') {
        _saldo += valorDinheiro;
      } else {
        _saldo -= valorDinheiro;
      }
      _historico.removeAt(index);
    });
  }

  void _abrirAnalises() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Analises(historico: _historico)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
            left: 16.0,
            right: 16.0,
            bottom: 16.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Saldo Disponível',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white54,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 12),

              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 40,
                    ),
                    decoration: AppTheme.caixaCustomizada,
                    child: Text(
                      "${_saldo.toStringAsFixed(2)} €",
                      style: const TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 35),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _abrirAddDinheiro,
                    child: const Text("Add dinheiro"),
                  ),
                  ElevatedButton(
                    onPressed: _abrirAddDespesa,
                    child: const Text("Add despesa"),
                  ),
                  ElevatedButton(
                    onPressed: _abrirAnalises,
                    child: const Text('Análises'),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Expanded(
                child: ListView.builder(
                  itemCount: _historico.length,
                  itemBuilder: (context, index) {
                    final item = _historico[index];
                    String valorMostrar;
                    if (item['tipos'] == 'despesa,') {
                      valorMostrar =
                          "- €${item['valor'].getDouble().toStringAsFixed(2)}";
                    } else {
                      valorMostrar =
                          "+ €${item['valor'].getDouble().toStringAsFixed(2)}";
                    }
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: item['tipos'] == 'despesa,'
                            ? AppTheme.corDespesa.withOpacity(0.15)
                            : AppTheme.corDinheiro.withOpacity(0.15),
                        child: Icon(
                          item['tipos'] == 'despesa,'
                              ? Icons.arrow_downward
                              : Icons.arrow_upward,
                          color: item['tipos'] == 'despesa,'
                              ? AppTheme.corDespesa
                              : AppTheme.corDinheiro,
                          size: 20,
                        ),
                      ),
                      title: Text(
                        item['descricao'] ?? 'Sem descrição',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      // Data organizada como um subtítulo pequeno e discreto
                      subtitle: Text(
                        item['data'] ?? '',
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 12,
                        ),
                      ),
                      // Valor financeiro alinhado perfeitamente no lado direito
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            valorMostrar,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: item['tipos'] == 'despesa,'
                                  ? AppTheme.corDespesa
                                  : AppTheme.corDinheiro,
                            ),
                          ),
                          if (item['tipos'] == 'despesa,') ...[
                            const SizedBox(width: 8),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: AppTheme.corDespesa,
                                size: 20,
                              ),
                              onPressed: () => _removerItem(index),
                            ),
                          ],
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
