class Veiculo{
  late int _cod;
  late String _modelo;
  late String _marca;
  late String _cor;
  late double _km;
  late bool _status;

  Veiculo(int cod, String marca, String modelo, String cor){
    this._cod = cod;
    this._marca = marca;
    this._modelo = modelo;
    this._cor = cor;
    this._km = 0;
    this._status = true;
  }

  //get e set de todos os atributos
  int get cod => this._cod;

  String get modelo => this._modelo;
  set modelo(String modelo) => this._modelo = modelo;

  String get marca => this._marca;
  set marca(String marca) => this._marca = marca;

  String get cor => this._cor;
  set cor(String cor) => this._cor = cor;

  double get km => this._km;
  set km(double km) => this._km = km;

  bool get status => this._status;
  set status(bool status)=> this._status = status;
}