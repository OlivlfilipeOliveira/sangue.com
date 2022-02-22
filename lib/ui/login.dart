import 'package:flutter/material.dart';

import 'package:sangueom/ui/tabs_navigator.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  String _platformVersion = "null";

  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 60.0, left: 40.0, right: 40.0),
          color: Colors.white,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    //diminui o tamanho da imagem
                    width: 230,
                    height: 230,
                    child: Image.asset("imagens/logo.png"),
                  ),
                  
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 60,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [
                            0.3,
                            1
                          ],
                          colors: [
                            Colors.red,
                            Colors.redAccent
                          ]),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: SizedBox.expand(
                      child: FlatButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                            Container(
                              child: SizedBox(
                                child: Icon(
                                  Icons.login,
                                  color: Colors.white,
                                ),
                                //Image.asset("images/login.jpeg"),
                                height: 28,
                                width: 28,
                              ),
                            )
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TabsNavigator()));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}