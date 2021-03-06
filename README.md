# Gastos Mensais

Projeto com o objetivo de estudar clean architecture.

## Descrição

Projeto CRUD para adicionar contas fixas e contas variaveis no mes, com visualização do saldo devedor do mes vigente.

<div style="display: inline_block"><br>
  <img align="center" alt="eye_open" height="500" width="250" src="images/dashboard_aberto.jpeg">
  <img align="center" alt="eye_close" height="500" width="250" src="images/dashboard_fechada.jpeg">
</div>

## Desenvolvimento 
- [ ] Dashboard.
  - [ ] Formatar Valor na Regra de Negocio. 
  - [ ] Atualizar o valor.
- [ ] Modulo Contas Fixas.
  - [x] Excluir Despesa. 
  - [x] Desfazer pagamento.
  - [ ] Ordenar por não pagas.
  - [x] Adicionar Pergunta de Confirmação.
- [ ] Validação formulario. 
- [x] Melhorar componetização.
- [ ] Modulo Contas Variaveis.
  - [x] Operações banco de dados. 
  - [ ] Excluir Despesa. 
  - [ ] Desfazer pagamento.
  - [ ] Ordenar por não pagas.
  - [ ] Adicionar Pergunta de Confirmação.
  - [ ] Filtro por mes
- [ ] Pagamentos
- [ ] Testes Unitários - TDD

## Recursos
- Flutter_modular
- Sqflite
- Clean Architecture
- FutureBuilder<>
- SetState()
- Navegação com o modular
  

## Considerações
- Praticar e compreender melhor o Clean Architecture, até por isso separei o databse em um modulo e apliquei a arquitetura.
- Praticar SQL com a utilização do Sqflite.
- Não foi utilizado gerencia de estado, pois nao era o objetivo.
  




A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
