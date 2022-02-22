import 'package:flutter/material.dart';
import 'package:sangueom/models/doacaoAbstract.dart';
import 'package:sangueom/services/carregarDados.dart';
import 'package:sangueom/ui/doacoes/doacoes_nao_realizadas_card.dart';
import 'package:sangueom/ui/doacoes/doacoes_realizadas_card.dart';


class Doacoes extends StatefulWidget {
  //que ele realizou
  @override
  _DoacoesState createState() => _DoacoesState();
}

class _DoacoesState extends State<Doacoes> {
  late List<Future<Widget>> doacoes;

  CarregarDados _carregarDados = CarregarDados();

  Future<Widget> getRealizadas() async{
    Widget _realizadas = await buildDoacoesRealizadas();

    return _realizadas;

  }

  Future<Widget> getNaoRealizadas() async{
    Widget _naoRealizadas = await buildDoacoesNaoRealizadas();

    return _naoRealizadas;

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      Future<Widget> _realizadas = getRealizadas();
      Future<Widget> _naoRealizadas = getNaoRealizadas();

      List<Future<Widget>> list = [_realizadas, _naoRealizadas];

      doacoes = list;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doações", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<List<Widget>>(
        future: Future.wait(
         [
           buildDoacoesRealizadas(),
           buildDoacoesNaoRealizadas()
         ]
        ),
        builder: (context, snapshot){
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (_, index){
              return snapshot.data![index];
            }
          );
        },
      ),
    );
  }
/*
  Widget _gerarCard(BuildContext context, int index){
    return Card(
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Paciente: "+doacoes[index].mostrarRelatorio().paciente),
          Text("Hospital: "+doacoes[index].mostrarRelatorio().hospital),
          Text("Tipo de Sangue: "+doacoes[index].mostrarRelatorio().tipoDeSangue),
          Text("Dias atrás: "+doacoes[index].mostrarRelatorio().dias.toString()),
          Text("Mensagem: "+doacoes[index].mostrarRelatorio().menssagem) 
        ],
        ),
      )
    );
  }*/

  Future<Widget> buildDoacoesRealizadas() async {
    List<DoacaoAbstract> doacoesRealizadas = await _carregarDados.realizadas();

    List<Widget> doacoesRealizadasWidgets = doacoesRealizadas.map((e) => DoacoesRealizadasCard(e.mostrarRelatorio()).create()).toList();

    return Column(
        children: doacoesRealizadasWidgets
      );
  }

  Future<Widget> buildDoacoesNaoRealizadas() async{
    List<DoacaoAbstract> doacoesNaoRealizadas = await _carregarDados.naoRealizadas();

    List<Widget> doacoesNaoRealizadasWidgets = doacoesNaoRealizadas.map((e) => DoacoesNaoRealizadasCard(e.mostrarRelatorio()).create()).toList();

    return Column(
        children: doacoesNaoRealizadasWidgets
      );
  }



}


/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doações", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: EdgeInsets.all(5.0),
        itemCount: doacoes.length,
        itemBuilder: (context, index){
          return _gerarCard(context, index);
        },
    
      ),
    );
  }
*/