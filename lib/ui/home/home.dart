
import 'package:flutter/material.dart';
import 'package:sangueom/services/carregarDados.dart';
import 'package:sangueom/ui/home/pontos/iponto.dart';
import 'package:sangueom/ui/home/pontos/pontos_service.dart';
import 'package:sangueom/ui/home/pontos_strategy/pontos_strategy_cinema.dart';
import 'package:sangueom/ui/home/pontos_strategy/pontos_strategy_lanche.dart';

class Initial extends StatefulWidget {
 
  @override
  _HomeState createState() => _HomeState();
}



class _HomeState extends State<Initial> {

  CarregarDados _carregarDados = CarregarDados();
  int pontos = 0;
  late IPonto cinemaPonto;
  late IPonto comidaPonto;
  late IPonto selectedPonto;
  late PontosService pontosService;

  List<String> gastos = ["Cinesystem", 
      "Kinoplex",
      "Lumiere",
      "Cine Arte"];

  @override
  void initState(){
    super.initState();
    pontosService =  PontosService();
    this.pontos = _carregarDados.pontos;
    // TODO: implement initState
   
//    setPonto(this.cinemaPonto);
    cinemaPonto = PontoStrategyCinema();
    selectedPonto = cinemaPonto;
    comidaPonto = PontoStrategyLanche();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Home", style: TextStyle(color: Colors.white),), Text("Pontos: "+this.pontos.toString(), style: TextStyle(color: Colors.white),)],),
        centerTitle: true,
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text("Escolha a forma de gastar seus pontos: ", style: TextStyle(fontSize: 20.0),),
              Row(
                children: [
                  Text("Cinema "),
                  Radio<IPonto>(
                    value: cinemaPonto,
                    groupValue: selectedPonto,
                    onChanged: (IPonto? iPonto){
                      setPonto(iPonto);
                    },
                  )
                ],
              ),
              Row(
                children: [
                  Text("Comida "),
                  Radio<IPonto>(
                    value: comidaPonto,
                    groupValue: selectedPonto,
                    onChanged: (IPonto? iPonto) {
                      setPonto(iPonto);
                    },
                  )
                ],
              ),

              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 150,
                        width: 160,
                        color: Colors.cyan  ,
                        child: Padding(
                          padding: EdgeInsets.all(60.0),
                          child: Text(this.gastos[0], style: TextStyle(fontSize: 11.0),),
                        )
                      ),
                      Divider(),
                      Container(
                        height: 150,
                        width: 170,
                        color: Colors.red  ,
                        child: Padding(
                          padding: EdgeInsets.all(60.0),
                          child: Text(this.gastos[1], style: TextStyle(fontSize: 11.0),),
                        )
                      )
                    ],
                    ),
                    Divider(),
                   Row(
                    children: [
                      Container(
                        height: 150,
                        width: 160,
                        color: Colors.yellow  ,
                        child: Padding(
                          padding: EdgeInsets.all(60.0),
                          child: Text(this.gastos[2], style: TextStyle(fontSize: 11.0),),
                        )
                      ),
                      Container(
                        height: 150,
                        width: 170,
                        color: Colors.green  ,
                        child: Padding(
                          padding: EdgeInsets.all(60.0),
                          child: Text(this.gastos[3], style: TextStyle(fontSize: 11.0),),
                        )
                      )
                    ],
                    )
                ],
              )    
            ],
          ),
        
        ),
    );
  }

  void setPonto(IPonto? iPonto)  async{
     this.gastos = await iPonto!.escolher();
      print(gastos);
    setState((){
      selectedPonto = iPonto;
      pontosService.pontoStrategy = iPonto;
           
    });
  }
}