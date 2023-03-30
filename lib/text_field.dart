import 'package:flutter/material.dart';
import 'home_page.dart';

class NameInputPage extends StatefulWidget {
  const NameInputPage({Key? key}) : super(key: key);
  @override
  State<NameInputPage> createState() => _NameInputPageState();
}

class _NameInputPageState extends State<NameInputPage> {

  late TextEditingController _controller1;
  late TextEditingController _controller2;

  @override
  void initState() {
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0.00,
      //   backgroundColor: Color(0xFF141d2f),
      // ),

      body: Container(
        color: Color(0xFF141d2f),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              const Text(
                'Enter name of players',
                style: TextStyle(

                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(4.0, 4.0),
                      blurRadius: 3.0,
                      color: Colors.black,
                    ),
                    Shadow(
                      offset: Offset(4.0, 4.0),
                      blurRadius: 8.0,
                      color: Colors.black,
                    ),
                  ],
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.red),
                  cursorColor: Colors.red,
                  decoration: const InputDecoration(
                    labelText: 'Enter name of Player 1',
                    icon: Icon(
                      Icons.person,
                      color: Colors.red,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.red,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.red),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.green),
                  cursorColor: Colors.green,
                  decoration: const InputDecoration(
                    labelText: 'Enter name of Player 2',
                    icon: Icon(
                      Icons.person,
                      color: Colors.green,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.green,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.green),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Color(0xFF141d2f)),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),

                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26.0),
                              side: BorderSide(color: Colors.red)
                          )
                      )
                  ),
                  onPressed: () {
                    // Navigator for next page.
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                            Player1: _controller1.text,
                            Player2: _controller2.text,
                          )),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(76, 12, 76, 12),
                    child: const Text(
                      "Start Game",
                      style: TextStyle(color: Color(0xFF141d2f), fontSize: 22.0),
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}