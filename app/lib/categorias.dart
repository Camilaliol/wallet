//Criação da lista de Categorias

import 'package:flutter/material.dart';

final List<String> categorias = [
  'Alimentação',
  'Transporte',
  'Lazer',
  'Moradia e Contas',
  'Saúde',
  'Educação',
  'Outros',
];

final Map<String, IconData> icones = {
  'Alimentação': Icons.restaurant,
  'Transporte': Icons.directions,
  'Lazer': Icons.local_play,
  'Moradia e Contas': Icons.home,
  'Saúde': Icons.medical_services,
  'Educação': Icons.school,
  'Outros': Icons.category,
};
