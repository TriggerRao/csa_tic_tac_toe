import 'package:flutter/material.dart';
import 'text_field.dart';

class HomePage extends StatefulWidget {
  String Player1, Player2;
  HomePage({required this.Player1, required this.Player2});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<GameButton> buttonsList;

  var player1;
  var player2;
  var activePlayer;

  @override
  void initState(){
    super.initState();
    buttonsList = doInit();
  }

  List<GameButton> doInit() {
    player1 = [];
    player2 = [];
    activePlayer = 1;

    var gameButtons = <GameButton>[
      GameButton(id: 1),
      GameButton(id: 2),
      GameButton(id: 3),
      GameButton(id: 4),
      GameButton(id: 5),
      GameButton(id: 6),
      GameButton(id: 7),
      GameButton(id: 8),
      GameButton(id: 9),
    ];
    return gameButtons;
  }

  void playGame(GameButton gb){
    setState(() {
      if(activePlayer == 1){
        gb.text = "X";
        gb.bg = Colors.white;
        activePlayer = 2;
        player1.add(gb.id);
      }else{
        gb.text = "O";
        gb.bg = Colors.green;
        activePlayer = 1;
        player2.add(gb.id);
      }
      gb.enabled = false;
      int winner = checkWinner();
      if (winner == -1) {
        if (buttonsList.every((p) => p.text != "")) {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Match Over'),
              content: const Text('Match Tie'),
              actions: <Widget>[
                TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                    ResetGame();
                  },
                  child: const Text('Reset Game'),
                ),
              ],
            ),
          );
        }
      }
    });
  }

  void ResetGame(){
    buttonsList = doInit();
  }

  int checkWinner(){
    var winner = -1;
    if(player1.contains(1) && player1.contains(2) && player1.contains(3)){
      winner = 1;

    }else if(player1.contains(4) && player1.contains(5) && player1.contains(6)){
      winner = 1;
    }else if(player1.contains(7) && player1.contains(8) && player1.contains(9)){
      winner = 1;
    }else if(player1.contains(1) && player1.contains(5) && player1.contains(9)){
      winner = 1;
    }else if(player1.contains(3) && player1.contains(5) && player1.contains(7)){
      winner = 1;
    }else if(player1.contains(1) && player1.contains(4) && player1.contains(7)){
      winner = 1;
    }else if(player1.contains(2) && player1.contains(5) && player1.contains(8)){
      winner = 1;
    }else if(player1.contains(3) && player1.contains(6) && player1.contains(9)){
      winner = 1;
    }


    if(player2.contains(1) && player2.contains(2) && player2.contains(3)){
      winner = 2;
    }else if(player2.contains(4) && player2.contains(5) && player2.contains(6)){
      winner = 2;
    }else if(player2.contains(7) && player2.contains(8) && player2.contains(9)){
      winner = 2;
    }else if(player2.contains(1) && player2.contains(5) && player2.contains(9)){
      winner = 2;
    }else if(player2.contains(3) && player2.contains(5) && player2.contains(7)){
      winner = 2;
    }else if(player2.contains(1) && player2.contains(4) && player2.contains(7)){
      winner = 2;
    }else if(player2.contains(2) && player2.contains(5) && player2.contains(8)){
      winner = 2;
    }else if(player2.contains(3) && player2.contains(6) && player2.contains(9)){
      winner = 2;
    }

    if(winner != -1){
      if(winner == 1){
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Match Over'),
            content: const Text('Player 1 is the winner'),
            actions: <Widget>[
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                  ResetGame();
                },
                child: const Text('Reset Game'),
              ),
            ],
          ),
        );
      }
      else{
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Match Over'),
            content: const Text('Player 2 is the winner'),
            actions: <Widget>[
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                  ResetGame();
                },
                child: const Text('Reset'),
              ),
            ],
          ),
        );
      }
    }
    return winner;
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tic Tac Toe',
          style: TextStyle(color: Colors.white, fontSize: 26.0),
        ),
        centerTitle: true,
        elevation: 0.00,
        backgroundColor: const Color(0xFF141d2f),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: const Color(0xFF141d2f),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: GridView.builder(
                  itemBuilder: (BuildContext context, int i) {
                    return SizedBox(
                      width: 100,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: buttonsList[i].enabled?()=>playGame(buttonsList[i]):null,
                          child: Text(
                            buttonsList[i].text,
                            style: const TextStyle(color: Colors.white, fontSize: 80.0),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonsList[i].bg,
                            side: const BorderSide(color: Colors.white, width: 5),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: buttonsList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                  ),
                ),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(const Color(0xFF141d2f)),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),

                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26.0),
                              side: const BorderSide(color: Colors.red)
                          )
                      )
                  ),
                  onPressed: () {
                    ResetGame();
                    showDialog(context: context, builder: (BuildContext context){
                      return const AlertDialog(
                        title: Text(
                          "Reset Successful",
                          style: TextStyle(color: Colors.white, fontSize: 22.0),
                          textAlign: TextAlign.center,
                        ),
                        content: Text("Reset done successfully, click on empty cell to proceed.",
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        backgroundColor: Color(0xFF141d2f),
                      );
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(76, 12, 76, 12),
                    child: Text(
                      "Reset",
                      style: TextStyle(color: Color(0xFF141d2f), fontSize: 22.0),
                    ),
                  )
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(const Color(0xFF141d2f)),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),

                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26.0),
                              side: const BorderSide(color: Colors.red)
                          )
                      )
                  ),

                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const NameInputPage()),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(76, 12, 76, 12),
                    child: Text(
                      "Input names again",
                      style: TextStyle(color: Color(0xFF141d2f), fontSize: 22.0),
                    ),
                  )
              ),
              const SizedBox(
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GameButton {
  final id;
  String text;
  Color bg;
  bool enabled;

  GameButton(
      {this.id, this.text = "", this.bg = const Color(0xFF141d2f), this.enabled = true}
      );
}