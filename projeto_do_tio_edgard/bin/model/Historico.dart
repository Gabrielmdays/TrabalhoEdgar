class Historico {
  List<String> registros = [];

  void adicionar(String registro) {
    registros.add(registro);
  }

  void listar() {
    print("\n📅 ═════════════════════════════════");
    print("         HISTÓRICO DA SEMANA        ");
    print("═══════════════════════════════════");
    if (registros.isEmpty) {
      print("⚠️ Nenhum medicamento tomado ainda.");
    } else {
      for (var r in registros) {
        print("✔️ $r");
      }
    }
    print("═══════════════════════════════════\n");
  }
}
