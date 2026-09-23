import 'package:app/paginas/principal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // faz com o flutter configure tudo antes de iniciar a tradução
  initializeDateFormatting('pt_PT', null).then((_) {
    //Ativa o formato da data de portugal
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  //arquivo principal do app
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'Wallet',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      supportedLocales: const [
        Locale('pt', 'PT'), // Português de Portugal
      ],
      home: const Principal(
        title: 'Wallet',
      ), // chamando a pagina principal_importou
    );
  }
}
