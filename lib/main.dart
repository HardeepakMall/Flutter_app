import 'package:flutter/material.dart';
import 'next_page/next_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: _MyAppExt());
  }
}

class _MyAppExt extends StatefulWidget {
  const _MyAppExt({super.key});

  @override
  State<_MyAppExt> createState() => __MyAppExtState();
}

class __MyAppExtState extends State<_MyAppExt> {
  String buttonName = 'Click';
  int currentIndex = 0;
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App Title')), //AppBar
      body: Center(
        child: currentIndex == 0
            ? Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.tealAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor:
                            Colors.orange, // Button background color
                      ),
                      onPressed: () {
                        setState(() {
                          buttonName = 'Clicked!';
                        });
                      },
                      child: Text(buttonName),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const NextPage(),
                          ),
                        );
                      },
                      child: const Text('Next Page'),
                    ),
                  ],
                ),
              )
            : GestureDetector(
                onTap: () {
                  setState(() {
                    _isClicked = !_isClicked;
                  });
                },
                child: _isClicked
                    ? Image.asset('images/wallpaper.jpg')
                    : Image.network(
                        'https://www.shutterstock.com/image-photo/aurora-borealis-northern-lights-over-600nw-2524531261.jpg',
                      ),
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(Icons.settings),
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
