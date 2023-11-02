class Produto {
  String nome;
  double preco;
  int estoque;

  Produto(this.nome, this.preco, this.estoque);

  void atualizarEstoque(int quantidade) {
    estoque -= quantidade;
  }
}

class Cliente {
  String nome;
  double totalCompras = 0;
  double debito = 0;

  Cliente(this.nome);

  void realizarCompra(Produto produto, int quantidade, bool crediario) {
    double valorCompra = produto.preco * quantidade;
    if (crediario) {
      debito += valorCompra;
    }
    totalCompras += valorCompra;
    produto.atualizarEstoque(quantidade);
  }
}

class Funcionario {
  String nome;
  double salarioFixo;
  double comissao = 0;

  Funcionario(this.nome, this.salarioFixo);

  void receberComissao(double valorComissao) {
    comissao += valorComissao;
  }
}

class Loja {
  List<Produto> estoque = [];
  List<Cliente> clientes = [];
  List<Funcionario> funcionarios = [];

  void adicionarProduto(Produto produto) {
    estoque.add(produto);
  }

  void adicionarCliente(Cliente cliente) {
    clientes.add(cliente);
  }

  void adicionarFuncionario(Funcionario funcionario) {
    funcionarios.add(funcionario);
  }

  void realizarVenda(Cliente cliente, Produto produto, int quantidade, bool crediario, Funcionario vendedor) {
    if (estoque.contains(produto) && estoque[estoque.indexOf(produto)].estoque >= quantidade) {
      double valorVenda = produto.preco * quantidade;
      if (crediario) {
        cliente.realizarCompra(produto, quantidade, true);
      } else {
        cliente.realizarCompra(produto, quantidade, false);
      }
      vendedor.receberComissao(valorVenda * 0.1); 
    } else {
      print("Produto fora de estoque");
    }
  }

  void emitirFolhaDePagamento() {
    for (Funcionario funcionario in funcionarios) {
      double salarioTotal = funcionario.salarioFixo + funcionario.comissao;
      print("Funcionário: ${funcionario.nome}, Salário Total: $salarioTotal");
    }
  }

  void realizarPagamentoDebitos(Cliente cliente) {
    double debito = cliente.debito;
    if (debito > 0) {
      print("Pagamento de débitos para ${cliente.nome}: R\$ $debito");
      cliente.debito = 0;
    } else {
      print("Nenhum débito para ${cliente.nome}");
    }
  }

  void relatorioClientesDevedores() {
    for (Cliente cliente in clientes) {
      if (cliente.debito > 0) {
        print("Cliente: ${cliente.nome}, Débito: R\$ ${cliente.debito}");
      }
    }
  }

  void relatorioEstoque() {
    for (Produto produto in estoque) {
      print("Produto: ${produto.nome}, Estoque: ${produto.estoque}");
    }
  }
}

void main() {
  Loja minhaLoja = Loja();
  
  Produto p1 = Produto("Produto 1", 10.0, 100);
  Produto p2 = Produto("Produto 2", 20.0, 50);
  Cliente c1 = Cliente("Cliente 1");
  Funcionario f1 = Funcionario("Funcionário 1", 1000.0);
  
  minhaLoja.adicionarProduto(p1);
  minhaLoja.adicionarProduto(p2);
  minhaLoja.adicionarCliente(c1);
  minhaLoja.adicionarFuncionario(f1);
  
  minhaLoja.realizarVenda(c1, p1, 5, true, f1);
  minhaLoja.realizarPagamentoDebitos(c1);
  minhaLoja.relatorioClientesDevedores();
  minhaLoja.relatorioEstoque();
  minhaLoja.emitirFolhaDePagamento();
}
