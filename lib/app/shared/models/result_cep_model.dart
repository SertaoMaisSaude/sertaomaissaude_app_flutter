class ResultCep {
  String cep;
  String logradouro;
  String bairro;
  String localidade;
  String uf;
  String unidade;
  String ibge;

  ResultCep({
    this.cep,
    this.logradouro,
    this.bairro,
    this.localidade,
    this.uf,
    this.unidade,
    this.ibge,
  });

  factory ResultCep.fromJson(Map<String, dynamic> json) => ResultCep(
        cep: json["cep"],
        logradouro: json["logradouro"],
        bairro: json["bairro"],
        localidade: json["localidade"],
        uf: json["uf"],
        unidade: json["unidade"],
        ibge: json["ibge"],
      );
}
