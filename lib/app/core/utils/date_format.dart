DateTime convertStringToDateTime(String dataString) {
  List<String> partes = dataString.split('/');

  int dia = int.parse(partes[0]);
  int mes = int.parse(partes[1]);
  int ano = int.parse(partes[2]);

  DateTime data = DateTime(
    ano,
    mes,
    dia,
  );

  return data;
}
