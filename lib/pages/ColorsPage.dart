// ignore_for_file: file_names

import 'dart:math';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';

class PuzzleAlpha extends StatefulWidget {
  const PuzzleAlpha({Key? key}) : super(key: key);

  @override
  State<PuzzleAlpha> createState() => _PuzzleAlphaState();
}

class _PuzzleAlphaState extends State<PuzzleAlpha> {
  final Map<String, bool> score = {};

  final Map<String, dynamic> data = {
    "A": " 🍎 A-Apple",
    "B": " ⚽️ B-Ball",
    "C": " 🐈‍⬛ C-Car",
    "D": " 🦮 D-Dog",
    "E": " 🥚 E-Egg",
    "F": " 🐠 F-Fish",
    "G": " 🍇 G-Grapes",
    "H": " 🏠 H-House",
    "I": " 🍧 I-Icecream",
    "J": " 🤡 J-Joker",
    "K": " 🪁 K-Kite",
    "L": " 🍋 L-Lemon",
    "M": " 🐒 M-Monkey",
    "N": " 🪺 N-Nest",
    "O": " 🍊 O-Orange",
    "P": " 🖊 P-Pen",
    "Q": " 👸🏼 Q-Queen",
    "R": " 🌹 R-Rose",
    "S": " ⛴ S-Ship",
    "T": " 🐅 T-Tiger",
    "U": " ⛱ U-Umbrella",
    "V": " 🦺 V-Vest",
    "W": " ⌚️ W-Watch",
    "X": " 🎄 X-Xmas tree",
    "Y": " 🪀 Y-Yoyo",
    "Z": " 🦓 Z-Zebra",
  };

  void randomfunc() {
    int i = 0;
    List choices = [];

    Random random = Random();
    int randomNumber = random.nextInt(5);
    print("$randomNumber");

    data.forEach((key, value) {
      if (i >= randomNumber) {
        if (i < (randomNumber + 3)) {
          choices.add("$key : $value");
        }
      }
      i++;
      print('"$key" : "$value"');
    });

    print("$choices");
  }

  int seed = 0;
  @override
  Widget build(BuildContext context) {
    // int i = 0;
    // while (i <= 6) {
    //   var rndKey = randomChoice(choices.keys);
    //   choices[rndKey] = choices[rndKey];
    // }

    // var random = whole[randomChoice(whole.keys)];

    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.refresh_outlined),
            onPressed: () {
              setState(() {
                score.clear();
                seed++;
              });
            }),
        body: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: data.keys.map((emoji) {
                  return Draggable<String>(
                    data: emoji,
                    feedback: Emoji(emoji: emoji),
                    childWhenDragging: const Emoji(emoji: "_"),
                    child: Emoji(emoji: score[emoji] == true ? '☑️' : emoji),
                  );
                }).toList()
                  ..shuffle(Random(seed)),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    data.keys.map((emoji) => _buildDragTarget(emoji)).toList()
                      ..shuffle(Random(seed)),
              )
            ],
          ),
        ));
  }

  Widget _buildDragTarget(emoji) {
    return DragTarget<String>(
      builder: ((BuildContext context, List<String?> incoming, List rejected) {
        {
          return Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.blue[50]
                // color: choices[emoji],
                ),
            // color: choices[emoji],
            height: 80,
            width: 200,
            child: Row(children: [
              // Emoji(emoji: emoji),
              Text(
                data[emoji].toString(),
                style: const TextStyle(fontSize: 20, fontFamily: "anton"),
              ),
            ]),
          );
        }
      }),
    );
  }
}

class Emoji extends StatelessWidget {
  const Emoji({Key? key, required this.emoji}) : super(key: key);
  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 80,
        padding: const EdgeInsets.all(10),
        child: Text(
          emoji,
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 40,
            fontFamily: "TitanOne",
          ),
        ),
      ),
    );
  }
}

// ctrl+cmd+space "
