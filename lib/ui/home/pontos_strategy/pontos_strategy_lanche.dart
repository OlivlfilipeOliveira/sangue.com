
import 'package:sangueom/ui/home/pontos/iponto.dart';

class PontoStrategyLanche implements IPonto{
  //strategy
  @override
  Future<List<String>> escolher() async{
    return [
      "Subway", 
      "Mac",
      "Girafas",
      "Cabloco"
    ];
  }

}