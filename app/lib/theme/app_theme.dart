// lib/theme/app_theme.dart
import 'package:flutter/material.dart';


class AppTheme {
  // 🎨 Suas duas cores de destaque principais:
  static const Color corPrincipal = Color.fromARGB(255, 19, 1, 69);     // Azul Escuro Imponente
  static const Color corSecundaria = Color.fromARGB(255, 24, 10, 115); // Roxo Elegante

  // 💰 Cores financeiras para as ações do seu aplicativo:
  static const Color corDinheiro = Color(0xFF2AE430);  // Verde para receitas
  static const Color corDespesa = Color(0xFFE21305);   // Vermelho para despesas

  // 🍕 As cores que você escolheu e já usa no seu gráfico de pizza:
  static final List<Color> coresGrafico = [
    const Color.fromARGB(255, 226, 19, 5),
    const Color.fromARGB(255, 33, 219, 243),
    const Color.fromARGB(255, 42, 234, 48),
    const Color.fromARGB(255, 241, 151, 17),
    const Color.fromARGB(255, 239, 30, 193),
    const Color.fromARGB(255, 236, 217, 14),
  ];

  // 📦 O design padrão das caixinhas das legendas (com cantos arredondados):
  static BoxDecoration caixaCustomizada = BoxDecoration(
    color: Colors.grey.shade100,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Colors.grey.shade300, width: 1),
  );

  // o motor que junta e ativa todo o design 
  static ThemeData get  temaDoAplicativo{
    return ThemeData(
      useMaterial3: true //Ativa os padroes do google

      //Coloca as cores oficiais dentro do app 
      colorScheme: ColorScheme.fromSeed(
        seedColor: corPrincipal,
        primary: corPrincipal,
        secondary: corSecundaria,



        
        ),
    )
  }