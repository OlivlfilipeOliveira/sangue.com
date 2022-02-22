import 'package:sangueom/models/report.dart';

abstract class DoacaoAbstract{

  String paciente;
  String tipoDeSangue;
  String hospital;

  DoacaoAbstract({required this.paciente, required this.tipoDeSangue, required this.hospital});
  
  //TemplateMethod
  DoacaoReport mostrarRelatorio(){
    int dias = calcularDias();
    String mensagem = mostrarMensagem();

    return DoacaoReport(paciente: this.paciente, tipoDeSangue: this.tipoDeSangue, hospital: this.hospital,dias: dias, menssagem: mensagem); 
  }

  int calcularDias();

  String mostrarMensagem();

}