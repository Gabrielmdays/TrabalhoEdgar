# Gerenciador de Medicamentos - Projeto do Tio Edgard

## Descrição

Este projeto é um aplicativo de linha de comando em Dart para gerenciar medicamentos diários. O sistema permite cadastrar medicamentos, listar todos os medicamentos cadastrados, marcar medicamentos como tomados e visualizar o histórico semanal de uso.

## Estrutura das Classes

- **[`Medicamento`](bin/model/Medicamento.dart)**  
  Representa um medicamento cadastrado pelo usuário.  
  - `nome`: Nome do medicamento (String)
  - `horario`: Horário de administração (String, formato HH:MM)
  - `tomado`: Indica se o medicamento já foi tomado (bool, padrão: false)

- **[`Historico`](bin/model/Historico.dart)**  
  Armazena o histórico dos medicamentos tomados durante a semana.  
  - `registros`: Lista de registros (List<String>) contendo informações sobre os medicamentos tomados e o horário.

## Lógica Implementada

O código principal está em [`projeto_do_tio_edgard.dart`](bin/projeto_do_tio_edgard.dart).  
O programa apresenta um menu interativo no terminal, permitindo ao usuário:

1. **Cadastrar medicamento:** Solicita nome e horário, adicionando à lista.
2. **Listar medicamentos:** Exibe todos os medicamentos cadastrados e seu status (tomado/pendente).
3. **Marcar medicamento como tomado:** Permite selecionar um medicamento e registrar o horário em que foi tomado.
4. **Ver histórico semanal:** Mostra todos os medicamentos marcados como tomados durante a semana.
5. **Sair:** Encerra o programa.

O histórico é atualizado automaticamente toda vez que um medicamento é marcado como tomado.

## Como Executar

1. Certifique-se de ter o [Dart SDK](https://dart.dev/get-dart) instalado (versão 3.9.0 ou superior).
2. No terminal, navegue até a pasta raiz do projeto.
3. Execute o comando abaixo para rodar o aplicativo:

```sh
dart run