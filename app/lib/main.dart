import 'package:app/paginas/pagina_principal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //arquivo principal do app
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const PaginaPrincipal(
        title: 'Wallet',
      ), // chamando a pagina principal_importou
    );
  }
}
