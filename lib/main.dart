import 'dart:core';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
//import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//import 'package:just_audio/just_audio.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:my_flutter_project/my_flutter_app_icons.dart';

import 'data_map.dart';

// List<DataMap> dataMap = [];
late Box<DataMap> box;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DataMapAdapter());
  box = await Hive.openBox<DataMap>('dataMap');
  String csv = "assets/data_map.csv"; //path to csv file asset
  String fileData = await rootBundle.loadString(csv);
  List<String> rows = fileData.split("\n");
  for (int i = 0; i < rows.length; i++) {
    //selects an item from row and places
    String row = rows[i];
    List<String> itemInRow = row.split(",");
    DataMap decMap = DataMap()
      ..NodeID = int.parse(itemInRow[0])
      ..YesID =  int.parse(itemInRow[1])
      ..NoID = int.parse(itemInRow[2])
      ..Description =  itemInRow[3]
      ..Question = itemInRow[4];


    int key = int.parse(itemInRow[0]);
    box.put(key,decMap);
    /*DataMap dm = DataMap(int.parse(itemInRow[0]), int.parse(itemInRow[1]),
        int.parse(itemInRow[2]), itemInRow[3], itemInRow[4]);*/
    //..NodeID = int.parse(itemInRow)
    /*(int.parse(itemInRow[0]), int.parse(itemInRow[1]),
        int.parse(itemInRow[2]), itemInRow[3], itemInRow[4]);*/

    /*int key = int.parse(itemInRow[0]);
    box.put(key,decMap);*/

    //Code to map item to the DecisionMap object
  }

  runApp(
    const MaterialApp(
      home: my_flutter_project(),
    ),
  );
}

class my_flutter_project extends StatefulWidget {
  const my_flutter_project({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyFlutterState();
  }
}

class MyFlutterState extends State<my_flutter_project> with TickerProviderStateMixin {
  //PLACE VARIABLES HERE
  late int NodeID;
  late int YesID;
  late int NoID;
  String Description = "";
  String Question = "";

  //String dynamic_text = "";

  final player = AudioPlayer();

  late AnimationController _animationController;
  late AudioCache audioCache;

  //late AudioPlayer audioPlayer;
  /*Duration _duration = new Duration();
  Duration _position = new Duration();*/
  bool isSongPlaying = false;
  bool isPlaying = false;

  /*void see1ToSeconds(int second){
    Duration newDuration = Duration(seconds: second);
    audioPlayer.seek(newDuration);
  }*/

  /*void initPlayer(){
    _animationController=AnimationController(vsync: this,duration: Duration(milliseconds: 750),reverseDuration: Duration(milliseconds: 750));
    audioPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.durationHandler = (d) => setState((){
      _duration = d;
    });
    audioPlayer.positionHandler = (p) => setState((){
      _position = p;
    });
  }*/

  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 750),
        reverseDuration: Duration(milliseconds: 750));
    //audioPlayer = new AudioPlayer();
    //PLACE CODE HERE TO INITALISE SERVER OBJECTS
    //dynamic_text = "WELCOME";
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        //PLACE CODE HERE YOU WANT TO EXECUTE IMMEDIATELY AFTER
        //THE UI IS BUILT
        DataMap current = box.get(0) as DataMap;
        NodeID = current.NodeID;
        YesID = current.YesID;
        NoID = current.NoID;
        Description = current.Description;
        Question = current.Question;
      });
    });
  }

  void clickHandlerYes(){
    setState(() {
      DataMap? current = box.get(YesID); //or cast as DataMap and remove the question mark
      if(current != null) {
        NodeID = current.NodeID;
        YesID = current.YesID;
        NoID = current.NoID;
        Description = current.Description;
        Question = current.Question;
        if (current.NodeID == 7) {
          player.play(AssetSource("ciaranHindsPhrase.mp3"));
        }
        if (current.NodeID == 19) {
          player.play(AssetSource("willSmithMistakePhrase.mp3"));
        }
        if (current.NodeID == 18) {
          player.play(AssetSource("andrewGarfieldPhrase.mp3"));
        }
        if (current.NodeID == 15) {
          player.play(AssetSource("denzelWashingtonPhrase.mp3"));
        }
        if (current.NodeID == 16) {
          player.play(AssetSource("benedictCumberbatchPhrase.mp3"));
        }
        if (current.NodeID == 9) {
          player.play(AssetSource("jessePlemonsPhrase.mp3"));
        }
        if (current.NodeID == 25) {
          player.play(AssetSource("kirstenDunstPhrase.mp3"));
        }
        if (current.NodeID == 26) {
          player.play(AssetSource("aunjanueEllisPhrase.mp3"));
        }
        if (current.NodeID == 27) {
          player.play(AssetSource("jessieBuckleyPhrase.mp3"));
        }
        if (current.NodeID == 28) {
          player.play(AssetSource("judiDenchPhrase.mp3"));
        }
        if (current.NodeID == 29) {
          player.play(AssetSource("arianaDeBosePhrase.mp3"));
        }
        if (current.NodeID == 32) {
          player.play(AssetSource("kristenStewartPhrase.mp3"));
        }
        if (current.NodeID == 35) {
          player.play(AssetSource("jessicaChastainPhrase.mp3"));
        }
        if (current.NodeID == 36) {
          player.play(AssetSource("penelopeCruzPhrase.mp3"));
        }


      }


    });
  }
  void clickHandlerNo(){
    setState(() {
      DataMap? current = box.get(NoID);
      if(current != null) {
        NodeID = current.NodeID;
        YesID = current.YesID;
        NoID = current.NoID;
        Description = current.Description;
        Question = current.Question;
        if (current.NodeID == 14) {
          player.play(AssetSource("javierBardemPhrase.mp3"));
        }
        if (current.NodeID == 5) {
          player.play(AssetSource("jkSimmonsPhrase.mp3"));
        }
        if (current.NodeID == 10) {
          player.play(AssetSource("KodiPhrase.mp3"));
        }
        if (current.NodeID == 34) {
          player.play(AssetSource("oliviaColmanPhrase.mp3"));
        }
        if (current.NodeID == 38) {
          player.play(AssetSource("nicoleKidmanPhrase.mp3"));
        }
      }

    });
  }

  /*void clickHandlerYes() {
    setState(() {
      for (DataMap dm in dataMap) {
        if (dm.NodeID == YesID) {
          NodeID = dm.NodeID;
          YesID = dm.YesID;
          NoID = dm.NoID;
          Description = dm.Description;
          Question = dm.Question;
          if (dm.NodeID == 7) {
            player.play(AssetSource("ciaranHindsPhrase.mp3"));
          }
          if (dm.NodeID == 19) {
            player.play(AssetSource("hardSlap.mp3"));
          }
          if (dm.NodeID == 18) {
            player.play(AssetSource("andrewGarfieldLaugh.mp3"));
          }
          if (dm.NodeID == 15) {
            player.play(AssetSource("denzelWashingtonPhrase.mp3"));
          }
          if (dm.NodeID == 16) {
            player.play(AssetSource("benedictCumberbatchPhrase.mp3"));
          }
          if (dm.NodeID == 9) {
            player.play(AssetSource("jessePlemonsPhrase.mp3"));
          }
          if (dm.NodeID == 35) {
            player.play(AssetSource("jessicaChastainPhrase.mp3"));
          }
          if (dm.NodeID == 36) {
            player.play(AssetSource("penelopeCruzPhrase.mp3"));
          }

          break;
        }
      }
    });
  }*/

  /*void clickHandlerNo() {
    setState(() {
      for (DataMap dm in dataMap) {
        if (dm.NodeID == NoID) {
          NodeID = dm.NodeID;
          YesID = dm.YesID;
          NoID = dm.NoID;
          Description = dm.Description;
          Question = dm.Question;
          if (dm.NodeID == 14) {
            player.play(AssetSource("javierBardemPhrase.mp3"));
          }
          if (dm.NodeID == 5) {
            player.play(AssetSource("jkSimmonsPhrase.mp3"));
          }
          if (dm.NodeID == 10) {
            player.play(AssetSource("KodiPhrase.mp3"));
          }
          if (dm.NodeID == 34) {
            player.play(AssetSource("oliviaColmanPhrase.mp3"));
          }
          if (dm.NodeID == 38) {
            player.play(AssetSource("nicoleKidmanPhrase.mp3"));
          }
          break;
        }
      }
    });
  }*/

  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
      if (isSongPlaying == false) {
        player.play(AssetSource("oscarThemeSong.mp3"));
        setState(() {
          isSongPlaying = true;
        });
      } else {
        player.pause();
        //audioPlayer.pause();
        setState(() {
          isSongPlaying = false;
        });
      }
      //player.play(AssetSource("oscarThemeSong.mp3"));
    });
  }

  /*void buttonHandler() {
    setState(() {
      //dynamic_text = "I got Clicked";
    });
  }*/

  //final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xffffb700),
          foregroundColor:Color(0xff000000),
          title: Text('WELCOME TO MY ACTOR GUESSING GAME FOR OSCARS 2021/22')),
      //Image.network(C:\Users\r pics),
      //Flutter UI Widgets go here
      backgroundColor: Color(0xFF000000), //0xFFFFFDD0
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height, //*0.4,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset('assets/images/blackTrophy.jpeg',
                  height: 600, width: 190),
              /*Text("Icon"),
              ListTile(
                leading: Icon(MyFlutterApp.check,
                color: Colors.green, size: 30,),
                title: Text("YES"),
              ),*/
              /*Icon(
                Icons.favorite,
                color: Colors.pink,
                size:24.0,
              ),*/
              //audioCache.load("assets/audios/oscarSong.mp3");
              //AssetsAudioPlayer.newPlayer().open(Audio("assets/audios/oscarSong.mp3"), autoPlay: true, showNotification: true,);
              //Audio("assets/audios/oscarSong.mp3"),

              Align(
                  child: IconButton(
                    iconSize: 100,
                    splashColor: Colors.white,
                    color: Color(0xFFffffff),
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.play_pause,
                      progress: _animationController,
                    ),
                    onPressed: () {
                      _handleOnPressed(); /*player.play(AssetSource("oscarThemeSong.mp3"));*/
                    },
                  )),

              /*Align(
                alignment: const Alignment(-0.67,-0.8),
                child: ElevatedButton.icon(
                  onPressed: () async{
                    //player.play(AssetSource("oscarThemeSong.mp3"));
                    player.play(AssetSource("hardSlap.mp3"));
                    //final assetsAudioPlayer = AssetsAudioPlayer();
                    //assetsAudioPlayer.open(Audio("assets/oscarThemeSong.mp3"),);
                    //assetsAudioPlayer.playOrPause();


                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical:10),
                    textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  icon: Icon(
                    MyFlutterApp.check_circle,
                    color: Colors.lightGreenAccent,
                    size: 45.0,
                  ),
                  label: const Text(
                    "Music",
                    /*style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),*/
                  ),
                ),
              ),*/

              Align(
                alignment: const Alignment(-0.67, 0.8),
                child: ElevatedButton.icon(
                  onPressed: () {
                    clickHandlerYes();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  icon: Icon(
                    MyFlutterApp.check_circle,
                    color: Colors.lightGreenAccent,
                    size: 45.0,
                  ),
                  label: const Text(
                    "YES",
                    /*style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),*/
                  ),
                ),
              ),

              Align(
                alignment: const Alignment(0.67, 0.8),
                child: ElevatedButton.icon(
                  onPressed: () {
                    clickHandlerNo();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffa4161a),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  icon: Icon(
                    MyFlutterApp.cancel,
                    color: Color(0xfff25c54),
                    size: 45.0,
                  ),
                  label: const Text(
                    "NO",
                    /*style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),*/
                  ),
                ),
              ),
              /*Align(
                alignment: const Alignment(-0.67,0.8),
                child: MaterialButton(
                  onPressed: () {buttonHandler();},
                  color: const Color(0xff3a21d9),
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  textColor: const Color(0xfffffdfd),
                  height: 60,
                  minWidth: 140,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: const Text(
                    "Yes Button",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),*/

              /*Align(
                alignment: const Alignment(0.67,0.8),
                child: MaterialButton(
                  onPressed: () {buttonHandler();},
                  color: const Color(0xff3a21d9),
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  textColor: const Color(0xfffffdfd),
                  height: 60,
                  minWidth: 140,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: const Text(
                    "No Button",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),*/
              Align(
                alignment: const Alignment(0.0, -0.9),
                child: Text(
                  Question /*dynamic_text*/,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 34,
                    color: Color(0xFFffffff), //4169e1
                  ),
                ),
              ),

              Align(
                alignment: const Alignment(0, -0.67),
                child: Text(
                  "Your Actor/Actress is $Description" /*dynamic_text*/,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    fontSize: 35,
                    color: Color(0xFFffffff), //964B00
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}