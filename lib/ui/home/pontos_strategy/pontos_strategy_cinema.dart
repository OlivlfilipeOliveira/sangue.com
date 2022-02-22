
import 'package:sangueom/ui/home/pontos/iponto.dart';

class PontoStrategyCinema implements IPonto{

  @override
  Future<List<String>> escolher() async{
    return [
      "Cinesystem", 
      "Kinoplex",
      "Lumiere",
      "Cine Arte"
    ];
  }

}