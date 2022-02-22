import 'package:sangueom/models/doacaoAbstract.dart';

class DoacaoRealizada extends DoacaoAbstract{

  DateTime data;
  late String mensagem;

  DoacaoRealizada({required String paciente, required String tipoDeSangue, required String hospital, required this.data}): super(hospital: hospital, paciente: paciente, tipoDeSangue: tipoDeSangue);

  @override
  int calcularDias() {
    return DateTime.now().difference(data).inDays;
  }

  @override
  String mostrarMensagem() {
    return "Doação realizada";
  }

}
