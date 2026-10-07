// lib/theme/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  //  cores de destaque principais:
  static const Color corPrincipal = Color.fromARGB(255, 19, 1, 69);
  static const Color corSecundaria = Color.fromARGB(255, 24, 10, 115);

  //Cores Neon para o fundo e efeitos do espaço
  static const Color corGalaxiaFundo = Color.fromARGB(
    255,
    10,
    6,
    34,
  ); // Azul-espacial ultra escuro para o fundo de todas as telas
  static const Color corCianoNeon = Color(
    0xFF00F5D4,
  ); // Ciano Neon brilhante para as bordas do app
  //Cores financeiras para as ações do seu aplicativo:
  static const Color corDinheiro = Color(0xFF39FF14); // Verde para receitas
  static const Color corDespesa = Color(0xFFFF0055); // Vermelho para despesas

  //Corres do grafico
  static final List<Color> coresGrafico = [
    const Color(0xFFF72585), // 💖 Rosa Cósmico
    const Color(0xFF00F5D4), // 🩵 Ciano Estelar (O seu ciano neon oficial)
    const Color(0xFF39FF14), // 💚 Verde Quasar (O seu verde dinheiro)
    const Color(0xFFFF9E00), // 🧡 Laranja Solar
    const Color(0xFF4CC9F0), // 💙 Azul Aurora
    const Color(0xFF7209B7), // 💜 Roxo Nebulosa
  ];

  //O design padrão das caixinhas das legendas (com cantos arredondados):
  static BoxDecoration caixaCustomizada = BoxDecoration(
    color: const Color(
      0xFF161035,
    ).withOpacity(0.4), // Roxo escuro semi-transparente
    borderRadius: BorderRadius.circular(
      16,
    ), // Cantos levemente mais arredondados e modernos (16)
    border: Border.all(
      color: corCianoNeon.withOpacity(0.25),
      width: 1.5,
    ), // Borda fina brilhando em ciano
  );

  // o motor que junta e ativa todo o design
  static ThemeData get temaDoAplicativo {
    return ThemeData(
      useMaterial3: true, //Ativa os padroes do google
      scaffoldBackgroundColor: corGalaxiaFundo, // add cor de galaxia ao fundo
      //Coloca as cores oficiais dentro do app
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: corPrincipal,
        primary: corPrincipal,
        secondary: corSecundaria,
      ),

      // CONFIGURAÇÃO GLOBAL DAS BARRAS SUPERIORES (AppBar)
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 20, 2, 70),
        foregroundColor: Colors.white,
        elevation: 0, //remove qualquer sombra abaixo da barra
        centerTitle: true,
      ),

      //CONFIGURAÇÃO GLOBAL DOS CAMPOS DE DIGITAÇÃO (Inputs)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(
          0xFF161035,
        ), //Caixa escura para não estourar o olho do usuário no escuro
        labelStyle: const TextStyle(color: Colors.white70),
        hintStyle: const TextStyle(color: Colors.white30),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), //cantos arrendodado
          borderSide: const BorderSide(color: corCianoNeon, width: 2),
        ),
      ),

      // CONFIGURAÇÃO GLOBAL DE TODOS OS BOTÕES ELEVADOS
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 58, 8, 186), //
          foregroundColor: const Color(
            0xFF070417,
          ), // Cor do Texto dentro do Botão
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ), // Botão gordinho e elegante
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              12,
            ), // Cantos do botão arredondados
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          shadowColor: const Color.fromARGB(255, 15, 111, 133).withOpacity(0.5),
          elevation: 6, //levanta o botao para destarcar a sombra neon
        ),
      ),
    ); // Fecha o ThemeData
  }
} // Chave final que fecha a classe AppTheme inteira de forma correta!
