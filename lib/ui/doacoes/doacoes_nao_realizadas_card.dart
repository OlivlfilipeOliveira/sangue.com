import 'package:flutter/material.dart';
import 'package:sangueom/models/report.dart';
import 'package:sangueom/ui/doacoes/doacoes_card.dart';

class DoacoesNaoRealizadasCard extends AbstractCardDoacoes{

  DoacoesNaoRealizadasCard(DoacaoReport doacaoReport) : super(doacaoReport: doacaoReport);

  @override
  Widget build() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Paciente: "+doacaoReport.paciente),
            Text("Hospital: "+doacaoReport.hospital),
            Text("Tipo de Sangue: "+doacaoReport.tipoDeSangue),
            Text("Dias atrás: "+doacaoReport.dias.toString()),
            Text("Mensagem: "+doacaoReport.menssagem) 
          ],
        ),
        Icon(Icons.error, color: Colors.red,)
      ],
    );
  }

}