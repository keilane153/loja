class Locacao {
  late int _cod;
  late int _cod_veiculo;
  late String _cpf;
  late int _dias;
  late bool _status;

  Locacao(this._cod, this._cod_veiculo, this._cpf, this._dias){
    this._status = true;
  }

  int get cod => this._cod;

  int get cod_veiculo => this._cod_veiculo;
  set cod_veiculo(int cod) => this._cod_veiculo = cod;

  String get cpf => this._cpf;
  set cpf(String cpf) => this._cpf = cpf;

  int get dias => this._dias;
  set dias(int dias) => this._dias = dias;

  bool get status => this._status;
  set status(bool status) => this._status = status;
}
