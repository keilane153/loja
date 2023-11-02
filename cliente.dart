class Cliente {
  late String _nome;
  late String _sobrenome;
  late String _cpf;
  late String _genero;
  Cliente(this._nome, this._sobrenome, this._cpf, this._genero);


  //métodos gets e sets para todos os atributos. 
  String get nome => this._nome;
  set nome(String novo_nome) => this._nome = novo_nome;

  String get sobrenome => this._sobrenome;
  set sobrenome(String novo_sobrenome) => this._sobrenome = novo_sobrenome;

  String get cpf => this._cpf;
  set cpf(String novo_cpf) => this._cpf = novo_cpf;

  String get genero => this._genero;
  set genero(String novo_genero) => this._genero = novo_genero;

  String get nome_completo => this._nome + ' ' + this._sobrenome;

  String toString(){
    return this._nome + ' ' + this._sobrenome;
  }
}
