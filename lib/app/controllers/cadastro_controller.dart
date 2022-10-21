import 'package:flutter/cupertino.dart';
import 'package:resilience_muscle/app/models/cadastro_models.dart';

class CadastroController {
  late String emailController;
  late String senha;
  late String confirmaSenha;

  CadastroController(this.emailController, this.senha, this.confirmaSenha);

  void cadastroModel() {
    CadastroModel cadastroModel = CadastroModel(
      this.emailController,
      this.senha,
      this.confirmaSenha,
    );
  }
}
