import 'cliente.dart';
import 'veiculo.dart';
import 'locacao.dart';
import 'dart:io';

void main() {
  List<Locacao> locacoes = [];
  List<Cliente> clientes = [
    Cliente("João", "Silva", "123.456.789-01", "Masculino"),
    Cliente("Maria", "Santos", "987.654.321-09", "Feminino"),
    Cliente("Pedro", "Oliveira", "456.789.123-45", "Masculino"),
    Cliente("Ana", "Pereira", "789.123.456-78", "Feminino"),
    Cliente("Luiz", "Ribeiro", "234.567.890-12", "Masculino"),
    Cliente("Clara", "Ferreira", "345.678.901-23", "Feminino"),
    Cliente("Fernando", "Carvalho", "567.890.123-34", "Masculino"),
    Cliente("Mariana", "Lima", "678.901.234-56", "Feminino"),
    Cliente("Rafael", "Martins", "890.123.456-67", "Masculino"),
    Cliente("Julia", "Gomes", "789.012.345-78", "Feminino"),
  ];
  List<Veiculo> veiculos = [
    Veiculo(1, "Toyota", "Corolla", "Prata"),
    Veiculo(2, "Ford", "Fiesta", "Azul"),
    Veiculo(3, "Honda", "Civic", "Vermelho"),
    Veiculo(4, "Chevrolet", "Cruze", "Branco"),
    Veiculo(5, "Volkswagen", "Golf", "Preto"),
    Veiculo(6, "Hyundai", "Elantra", "Cinza"),
    Veiculo(7, "Nissan", "Altima", "Verde"),
    Veiculo(8, "BMW", "X5", "Prata"),
    Veiculo(9, "Mercedes-Benz", "C-Class", "Vermelho"),
    Veiculo(10, "Audi", "A4", "Preto"),
  ];
  //função para criar a base de dados para testes.
  //baseDados(clientes, veiculos);
  print(clientes);

  bool running = true;
  int op;
  //while para o menu de opções.
  while (running) {
    print(
        'LOCADORA\n1 - Listar todos os clientes.\n2 - Listar todos os veiculos.\n3 - Buscar Cliente Nome.\n4 - Buscar Veiculo por Código. \n5 - Alugar Veiculo\n6 - Devolver.\n0 - Sair.');
    op = int.parse(stdin.readLineSync()!);
    if (op == 0) {
      running = false;
    } else if (op == 1) {
      print('Lista de Clientes');
      for (int i = 0; i < clientes.length; i++) {
        print("Nome: ${clientes[i].nome_completo}");
        print('-' * 20);
      }
    } else if (op == 2) {
      print('Lista de Veiculos');
      listarVeiculos(veiculos);
    } else if (op == 3) {
      print("Qual o nome do cliente? ");
      String nome = stdin.readLineSync()!;
      dynamic posicao = buscaCliente(nome, clientes);
      if (posicao != -1) {
        print(
            "Nome: ${clientes[posicao].nome_completo}\nCPF: ${clientes[posicao].cpf}");
      } else {
        print('Cliente $nome não localizado.');
      }
    
    }else if (op == 4){
      print('Lista Veiculos');
    } else if (op == 5){
      print('Alugar Veículo.');
      print("CPF do Cliente: ");
      String cpf = stdin.readLineSync()!;
      print('Código do Veículo.');
      int cod = int.parse(stdin.readLineSync()!);
      print("Quantos dias? ");
      int dias = int.parse(stdin.readLineSync()!);
      //
      //verificar disponibilidade do veiculo através do status.
      Locacao loc = Locacao(1,cod, cpf, dias);
      locacoes.add(loc);


    }else if(op == 6){
      print('Devolução');
      print('qual é o Código do Veículo?');
      int cod = int.parse(stdin.readLineSync()!);
      int posicao = buscaLocacao(cod, locacoes);
      if (posicao != -1){
        int v = buscaVeiculo(locacoes[posicao].cod_veiculo, veiculos);
        double km_inicial = veiculos[v].km;
        print('Qual a km atual do veiculo');
        double km_atual = double.parse(stdin.readLineSync()!);
        print('Veiculo ${veiculos[v].cod} percorreu ${km_atual - km_inicial} km');
        veiculos[v].km = km_atual;
        veiculos[v].status = true;
        print("Quantos dias ficou em uso? ");
        int dias = int.parse(stdin.readLineSync()!);
        if (dias > locacoes[posicao].dias){
          print("Excedeu em ${dias - locacoes[posicao].dias} dias. Multa de R\$ ${dias*100},00");
        }else{
          print('Veiculo entregue.');
        }
        

      }else{
        print('Codigo não localizado');
      }

    }
    else {
      print('Digite uma opção válida.');
    }
  }
}

void baseDados(List<Cliente> c, List<Veiculo> v) {}

void cadastraClientes() {}
void cadastraVeiculos() {}
void listarVeiculos(List<Veiculo> veiculos) {
  for (Veiculo v in veiculos) {
    print("Código: ${v.cod}\nModelo: ${v.modelo}");
    print('-' * 20);
  }
}

int buscaCliente(String nome, List<Cliente> clientes) {
  int achou = -1;

  for (int i = 0; i < clientes.length; i++) {
    if (clientes[i].nome == nome) {
      achou = i;
      break;
    }
  }
  return achou;
}

int buscaLocacao(int cod, List<Locacao> locacoes){
  int achou = -1;
  for (int i = 0; i < locacoes.length; i++) {
    if (locacoes[i].cod == cod) {
      achou = i;
      break;
    }
  }
  return achou;
}

int buscaVeiculo(int cod, List<Veiculo> veiculos){
  int achou = -1;
  for (int i = 0; i < veiculos.length; i++) {
    if (veiculos[i].cod == cod) {
      achou = i;
      break;
    }
  }
  return achou;
}