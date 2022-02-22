
import 'package:flutter/material.dart';
import 'package:sangueom/ui/doacoes/doacoes.dart';
import 'package:sangueom/ui/home/home.dart';
import 'package:sangueom/ui/solicitacoes.dart';

//arquivo que faz as mudanÃ§as entre as telas das tabs
class TabsNavigator extends StatefulWidget {
  @override
  _TabsNavigatorState createState() => _TabsNavigatorState();
}

class _TabsNavigatorState extends State<TabsNavigator> {

  int _selectedIndex = 0;

  final _widgetOptions = [
    Initial(),
    Doacoes(),
    Solicitacoes(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(Icons.home,), label: "Home",  ),
          BottomNavigationBarItem(icon: Icon(Icons.library_books), label: "Doações"),
          BottomNavigationBarItem(icon: Icon(Icons.playlist_add), label: "Solicitações" ),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

}