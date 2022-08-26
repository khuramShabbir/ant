import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      Center(
        child: Container(
          height:
              850, // use 'MediaQuery.of(context).size.height' to fit the screen height,
          color: Colors.red,
        ),
      )
    ];

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Stack(
            children: <Widget>[
              _children[0],
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: bottomNavigationBar(),
              ),
            ],
          ),
        ));
  }
}

Widget bottomNavigationBar() {
  return Container(
    margin: EdgeInsets.only(left: 16, right: 16, bottom: 20),
    decoration: BoxDecoration(
      color: Colors.amber,
      borderRadius: BorderRadius.circular(120),
    ),
    child: BottomNavigationBar(
      backgroundColor: Colors.transparent,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.local_activity), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.inbox), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
      ],
    ),
  );
}
