import 'package:flutter/material.dart';

class Solicitacoes extends StatefulWidget {
  //qu ele fez e que ele recebeu

  @override
  _SolicitacoesState createState() => _SolicitacoesState();
}

class _SolicitacoesState extends State<Solicitacoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Solicitações", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: Container(),
    );
  }
}