import 'dart:io';

import 'model/Medicamento.dart';
import 'model/Historico.dart';

List<Medicamento> medicamentos = [];
Historico historico = Historico();

void main() {
  try {
    _runAppLoop();
  } on IOException catch (e) {
    _handleFatalIoError("Erro de Entrada/Saída (E/S)", e);
  } on UnsupportedError catch (e) {
    _handleFatalIoError("Operação de E/S não suportada", e);
  } catch (e) {
    _handleFatalIoError("Erro inesperado", e);
  }
}

void _runAppLoop() {
  while (true) {
    print("\n═══════════════════════════════════");
    print("       💊 GERENCIADOR DE MEDS       ");
    print("═══════════════════════════════════");
    print("1️⃣  ➤ Cadastrar medicamento");
    print("2️⃣  ➤ Listar medicamentos");
    print("3️⃣  ➤ Marcar medicamento como tomado");
    print("4️⃣  ➤ Ver histórico semanal");
    print("5️⃣  ➤ Sair");
    stdout.write("\n👉 Escolha uma opção: ");

    String? opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        cadastrarMedicamento();
        break;
      case '2':
        listarMedicamentos();
        break;
      case '3':
        marcarTomado();
        break;
      case '4':
        historico.listar();
        break;
      case '5':
        print("\n👋 Saindo... até logo!");
        exit(0);
      default:
        print("⚠️ Opção inválida, tente novamente.");
    }
  }
}

void _handleFatalIoError(String type, Object error) {
  stderr.writeln("\n🚨 ERRO FATAL: $type - $error");
  stderr.writeln(
    "Este programa de linha de comando requer suporte total a entrada/saída padrão (stdin/stdout).",
  );
  stderr.writeln(
    "Certifique-se de que está executando em um ambiente de terminal/console compatível,",
  );
  stderr.writeln(
    "por exemplo, usando `dart run <nome_do_arquivo.dart>` ou compilando para um executável nativo.",
  );
  exit(1);
}

void cadastrarMedicamento() {
  stdout.write("\n📝 Digite o nome do medicamento: ");
  String? nome = stdin.readLineSync();

  stdout.write("⏰ Digite o horário (HH:MM): ");
  String? horario = stdin.readLineSync();

  if (nome != null &&
      horario != null &&
      nome.isNotEmpty &&
      horario.isNotEmpty) {
    medicamentos.add(Medicamento(nome, horario));
    print("✅ Medicamento '$nome' cadastrado para $horario.");
  } else {
    print("⚠️ Nome ou horário não podem ser vazios.");
  }
}

void listarMedicamentos() {
  print("\n📋 ═════════════════════════════════");
  print("          LISTA DE MEDICAMENTOS      ");
  print("═══════════════════════════════════");
  if (medicamentos.isEmpty) {
    print("⚠️ Nenhum medicamento cadastrado.");
  } else {
    for (int i = 0; i < medicamentos.length; i++) {
      var m = medicamentos[i];
      String status = m.tomado ? "✔️ Tomado" : "⏰ Pendente";
      print(
        " ${i + 1}. ${m.nome.padRight(20)} - ${m.horario.padRight(5)} - $status",
      );
    }
  }
  print("═══════════════════════════════════\n");
}

void marcarTomado() {
  listarMedicamentos();
  if (medicamentos.isEmpty) return;

  stdout.write("👉 Digite o número do medicamento tomado: ");
  String? input = stdin.readLineSync();
  int? escolha = int.tryParse(input ?? "");

  if (escolha != null && escolha > 0 && escolha <= medicamentos.length) {
    var m = medicamentos[escolha - 1];
    if (!m.tomado) {
      m.tomado = true;
      historico.adicionar(
        "${m.nome} às ${DateTime.now().toLocal().toString().split('.')[0]}",
      );
      print("✅ ${m.nome} marcado como tomado!");
    } else {
      print("⚠️ Esse medicamento já foi marcado como tomado.");
    }
  } else {
    print("⚠️ Opção inválida.");
  }
}
