# PRD: Wallet

**Version:** 1.0
**Date:** 2026-09-16
**Autora:** Camila Oliveira
**Status:** Accepted

---

# Declaração do Problema

Os métodos atuais para acompanhar o dinheiro que entra e sai são demorados e fragmentados. Sem uma forma rápida de registar novas receitas e gastos diários, os utilizadores perdem o controlo do seu fluxo de caixa. Além disso, a ausência de relatórios visuais e automáticos impede-os de perceber para onde vai o seu dinheiro e como podem poupar.

# Personas

## Nativos digitais (18 a 30 anos)

Compostos maioritariamente por estudantes universitários e jovens profissionais em início de carreira. Têm uma vida financeira ativa, mas fragmentada, dependendo quase exclusivamente de canais digitais e aplicações para gerir o seu dia a dia.

# Requisitos Funcionais

---

## 1. Declaração de Problema

**Os utilizadores sentem dificuldades em gerir o seu orçamento diário devido à falta de visibilidade financeira em tempo real e à complexidade em registar transações manualmente.**

- **O Problema:** Os métodos atuais para acompanhar o dinheiro que entra e sai são demorados e fragmentados. Sem uma forma rápida de registar novas receitas e gastos diários, os utilizadores perdem o controlo do seu fluxo de caixa. Além disso, a ausência de relatórios visuais e automáticos impede-os de perceber para onde vai o seu dinheiro e como podem poupar.
- **Quem é afetado:** Pessoas ativas, estudantes e jovens profissionais que procuram autonomia financeira, mas que não têm tempo ou paciência para gerir folhas de cálculo complexas.
- **Impacto:** Stress financeiro, gastos impulsivos acima do orçamento planeado e incapacidade de atingir metas de poupança a longo prazo.

---

## 2. Perfil de Público-Alvo: O Jovem Adulto Conectado

### Visão Geral

Nativos digitais (18–30 anos), compostos maioritariamente por estudantes universitários e jovens profissionais em início de carreira. Têm uma vida financeira ativa, mas fragmentada, dependendo quase exclusivamente de canais digitais e aplicações para gerir o seu dia a dia.

### Comportamento e Atitude

- **Imediatismo:** Valorizam a conveniência e a velocidade acima de tudo. Rejeitam fluxos complexos, burocracia ou processos com cliques excessivos.
- **Consumo focado em Experiências:** O orçamento é frequentemente alocado a subscrições de streaming, entregas de comida, saídas sociais, viagens e transportes partilhados.
- **Gestão Informal:** Consultam o saldo bancário com frequência, mas não planeiam despesas. Consideram ferramentas tradicionais de orçamento (como o Excel) aborrecidas, obsoletas e demoradas.

### Principais Dores (Pain Points)

- **Falta de Rastreio:** Dificuldade em controlar os pequenos gastos diários, resultando na sensação de que o dinheiro "desaparece" sem perceberem onde foi gasto.
- **Falta de Previsibilidade:** Ansiedade financeira a meio do mês por não saberem se o dinheiro disponível é suficiente para cobrir as despesas fixas e o lazer.
- **Barreira de Entrada:** Abandono de aplicações de finanças tradicionais devido à fricção e à complexidade na introdução de dados manuais.

### Necessidades no Produto (User Needs)

- **Registo Instantâneo:** Fluxos ultra-rápidos e intuitivos para adicionar depósitos e despesas no momento exato em que a transação ocorre.
- **Feedback Visual Direto:** Painel de análises limpo, sem tabelas complexas, focado em gráficos visuais e _insights_ rápidos que mostrem o estado real da sua saúde financeira num vislumbre.

---

## Requisitos Funcionais (RF)

### 1. Adicionar Depósito

- **RF1.1:** O sistema deve permitir introduzir um valor numérico (positivo) e associar uma categoria (Ex: Salário, Mesada, Freelance).
- **RF1.2:** O sistema deve permitir adicionar uma descrição opcional e selecionar a data/hora (predefinida para a atual).
- **RF1.3:** O sistema deve atualizar instantaneamente o saldo total do utilizador após a confirmação.

### 2. Adicionar Despesa

- **RF2.1:** O sistema deve permitir introduzir um valor numérico (positivo) e associar uma categoria (Ex: Alimentação, Lazer, Transportes).
- **RF2.2:** O sistema deve emitir um alerta visual se o valor da despesa for superior ao saldo disponível.
- **RF2.3:** O sistema deve deduzir o valor imediatamente do saldo total após a confirmação.

### 3. Análises

- **RF3.1:** O sistema deve exibir gráficos visuais e intuitivos (Ex: gráfico de queijo/tarte) divididos por categorias de gastos.
- **RF3.2:** O sistema deve permitir filtrar as análises por período de tempo (Semanal, Mensal, Anual).
- **RF3.3:** O sistema deve apresentar um comparativo simples entre o total de entradas (depósitos) e o total de saídas (despesas).

### 4. Histórico

- **RF4.1:** O sistema deve listar todas as transações (depósitos e despesas) por ordem cronológica inversa (mais recente primeiro).
- **RF4.2:** O sistema deve diferenciar visualmente as transações através de cores ou ícones (Ex: Verde para depósitos, Vermelho para despesas).

## Fora de Escopo

- **Múltiplas Moedas (Multi-currency):** O sistema suportará apenas uma moeda padrão única em EUR .
- **Autenticação com Terceiros (OAuth):** Não haverá autentificação
