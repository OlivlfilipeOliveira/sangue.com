
import 'package:sangueom/models/doacaoAbstract.dart';
import 'package:sangueom/models/doacaoNaoRealizada.dart';
import 'package:sangueom/models/doacaoRealizada.dart';

class CarregarDados{
  int pontos = 3;
  
  Future<List<DoacaoRealizada>> realizadas()  async{
    return [
      DoacaoRealizada(data: DateTime.utc(2020, 11, 9), hospital: "Hospital Chama", paciente: "José Raimundo Pedro", tipoDeSangue: "A+"),
      DoacaoRealizada(data: DateTime.utc(2021, 10, 11), hospital: "Hospital Chama", paciente: "José Pedro Raimundo", tipoDeSangue: "O+"),
      DoacaoRealizada(data: DateTime.utc(2022, 1, 9), hospital: "Hospital Regional de Arapiraca", paciente: "Pedro Raimundo José", tipoDeSangue: "A-"),
    ];

  }

  Future<List<DoacaoNaoRealizada>> naoRealizadas() async {
    return [
      DoacaoNaoRealizada(data: DateTime.utc(2021, 10, 9), hospital: "Hospital da mulher", paciente: "Maria Pedro Irmã", tipoDeSangue: "A-"),
      DoacaoNaoRealizada(data: DateTime.utc(2021, 11, 11), hospital: "Hospital Chama", paciente: "Irmã Pedro Maria", tipoDeSangue: "O-"),
      DoacaoNaoRealizada(data: DateTime.utc(2021, 12, 30), hospital: "Hospital Regional de Arapiraca", paciente: "Mari da Silva Srmã", tipoDeSangue: "A+"),
    ];
  }


 // List<DoacaoAbstract> gerarDoacoes (){
//    return [_realizadas, _naoRealizadas].expand((element) => element).toList();
 // }

}