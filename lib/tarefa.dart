class Tarefa {
  // Atributos
  //String nome = '';
  late String nome;
  late DateTime data;
  late bool concluida;

  // Construtor
  Tarefa(this.nome) {
    //this.nome = nome;
    data = DateTime.now();
    concluida = false;
  }

}




