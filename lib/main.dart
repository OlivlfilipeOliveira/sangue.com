import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sangueom/ui/login.dart';
import 'package:sangueom/ui/tabs_navigator.dart';
import 'package:splashscreen/splashscreen.dart';
void main() {
  runApp(MaterialApp(

    
    title: "AgroMet Station",
    home: Home(), 
    theme: ThemeData(primaryColor: Colors.white),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    //  DeviceOrientation.portraitDown,
    ]);
    return Container(
      child: SplashScreen(
        navigateAfterSeconds: Login(),
        seconds: 5,
        title: Text(
          "+Sangue.com",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
          textAlign: TextAlign.center,
        ),
        image: Image.asset("imagens/logo.png", ),
         photoSize: 150.0,
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: TextStyle(),
        onClick: ()=>print("+Sangue.com"),
        loaderColor: Colors.red,
        loadingText: Text("Carregando..."),
      ),
    );
  }
}
