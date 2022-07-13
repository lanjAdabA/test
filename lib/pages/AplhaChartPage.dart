// ignore: duplicate_ignore
// ignore: file_names
// import 'package:flutter/material.dart';

// class AlphachartPage extends StatefulWidget {
//   const AlphachartPage({Key? key}) : super(key: key);

//   @override
//   State<AlphachartPage> createState() => _AlphachartPageState();
// }

// class _AlphachartPageState extends State<AlphachartPage> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(child: Text("aplhabet page")),
//     );
//   }
// }

// import this Package in pubspec.yaml file
// dependencies:
//
//   flutter_staggered_animations:

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MyCustomWidget extends StatefulWidget {
  const MyCustomWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  @override
  Widget build(BuildContext c) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('VIEW ANIMATING GRIDVIEW'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const GridView2()),
            );
          },
        ),
      ),
    );
  }
}

class GridView2 extends StatelessWidget {
  const GridView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    int columnCount = 4;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Go Back"),
        centerTitle: true,
      ),
      body: AnimationLimiter(
        child: GridView.count(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          padding: EdgeInsets.all(w / 60),
          crossAxisCount: columnCount,
          children: List.generate(
            26,
            (int index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 500),
                columnCount: columnCount,
                child: ScaleAnimation(
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.fastLinearToSlowEaseIn,
                  scale: 1.5,
                  child: FadeInAnimation(
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: w / 30, left: w / 60, right: w / 60),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[100],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 40,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
