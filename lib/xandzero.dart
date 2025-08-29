import 'package:flutter/material.dart';

void main() {
  runApp(TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tic Tac Toe",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TicTacToePage(),
    );
  }
}

class TicTacToePage extends StatefulWidget {
  @override
  State<TicTacToePage> createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  List<String> board = List.filled(9, "");
  bool isXTurn = true;
  String winner = "";

  int xScore = 0;
  int oScore = 0;
  int drawScore = 0;

  void _handleTap(int index) {
    if (board[index] == "" && winner == "") {
      setState(() {
        board[index] = isXTurn ? "X" : "O";
        isXTurn = !isXTurn;
        _checkWinner();
      });
    }
  }

  void _checkWinner() {
    List<List<int>> winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pattern in winPatterns) {
      String a = board[pattern[0]];
      String b = board[pattern[1]];
      String c = board[pattern[2]];

      if (a != "" && a == b && b == c) {
        setState(() {
          winner = "$a Wins!";
          if (a == "X") {
            xScore++;
          } else {
            oScore++;
          }
        });
        return;
      }
    }

    if (!board.contains("") && winner == "") {
      setState(() {
        winner = "It's a Draw!";
        drawScore++;
      });
    }
  }

  void _resetBoard() {
    setState(() {
      board = List.filled(9, "");
      isXTurn = true;
      winner = "";
    });
  }

  void _resetAll() {
    setState(() {
      board = List.filled(9, "");
      isXTurn = true;
      winner = "";
      xScore = 0;
      oScore = 0;
      drawScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Scoreboard
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("Player X", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
                    Text("$xScore", style: TextStyle(fontSize: 22)),
                  ],
                ),
                Column(
                  children: [
                    Text("Draws", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey)),
                    Text("$drawScore", style: TextStyle(fontSize: 22)),
                  ],
                ),
                Column(
                  children: [
                    Text("Player O", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red)),
                    Text("$oScore", style: TextStyle(fontSize: 22)),
                  ],
                ),
              ],
            ),
          ),

          // Game Grid
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 9,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => _handleTap(index),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      board[index],
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: board[index] == "X" ? Colors.blue : Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Winner / Turn Message
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              winner == ""
                  ? (isXTurn ? "Player X's Turn" : "Player O's Turn")
                  : winner,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),

          // Control Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _resetBoard,
                child: Text("Next Round"),
              ),
              SizedBox(width: 15),
              ElevatedButton(
                onPressed: _resetAll,
                child: Text("Reset All"),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
