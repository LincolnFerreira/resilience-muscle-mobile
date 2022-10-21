class CadastroModel {
  late String _email = '';
  late String _senha = '';
  late String _confirmaSenha = '';

  CadastroModel(
    String email,
    String senha,
    String confirmaSenha,
  ) {
    validaEmail = email;
    validaSenha = senha;
    validaConfirmaSenha = confirmaSenha;
  }

  String get confirmaSenha => _confirmaSenha;

  set validaConfirmaSenha(String value) {
    _confirmaSenha = value;
  }

  String get senha => _senha;

  set validaSenha(String value) {
    _senha = value;
  }

  String get email => _email;

  set validaEmail(String validaEmail) {
    if (validaEmail == 'lincolnsp@gmail.com') {
      print('Login cadastrado!');
      _email = validaEmail;
    } else {
      print('Falha');
    }
  }

  @override
  String toString() {
    return 'CadastroModel{\n_email: $_email,\n_senha: $_senha,\n_confirmaSenha: $_confirmaSenha\n}';
  }
}
