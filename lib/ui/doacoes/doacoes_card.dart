
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sangueom/models/report.dart';

abstract class AbstractCardDoacoes{
  //factory method
  DoacaoReport doacaoReport;

  AbstractCardDoacoes({required this.doacaoReport});

  Widget create(){
    return Card(
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: build()
      )
    );
  }

  Widget build();
}