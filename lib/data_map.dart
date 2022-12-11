import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:hive_flutter/adapters.dart';
import 'package:my_flutter_project/main.dart';
import 'package:hive/hive.dart';

part 'data_map.g.dart';

/*void main() async {
  /*WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DataMapAdapter());
  box = await Hive.openBox<DataMap>('dataMap');*/


  runApp (
    const MaterialApp(
      home: my_flutter_project(),
    ),
  );
}*/





@HiveType(typeId: 0)
class DataMap{

  @HiveField(0)
  late int NodeID;

  @HiveField(1)
  late int YesID;

  @HiveField(2)
  late int NoID;

  @HiveField(3)
  late String Description;

  @HiveField(4)
  late String Question;

  //DataMap(this.NodeID, this.YesID, this.NoID, this.Description, this.Question);

  @override
  String toString() {
    return "'$Description',\n'$Question'";
  }
}
// DataMap getNode(int NodeID, nodeList){
//   DataMap toReturn = nodeList[0];
//   for (DataMap actor in nodeList){
//     if (actor.NodeID == NodeID){
//       toReturn=actor;
//     }
//   }
//   return toReturn;
// }