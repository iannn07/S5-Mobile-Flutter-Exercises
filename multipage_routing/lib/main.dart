import 'package:flutter/cupertino.dart';

void main() {
  runApp(const CupertinoApp(
    title: 'Multi Page Routing',
    home: FirstPage(),
  ));
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Mobile_GSLC_Session 17 - 1'),
        ),
        child: Container(
            margin: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hi There!',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Image(image: AssetImage("lib/img/Hi Cat.gif")),
                    Align(
                      alignment: Alignment.center,
                    )
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CupertinoButton.filled(
                        child: const Text('Next'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const SecondPage()),
                          );
                        },
                      )),
                )
              ],
            )));
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Mobile_GSLC_Session 17 - 2'),
        ),
        child: Container(
            margin: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: AssetImage("lib/img/Peek A Boo.png")),
                    SizedBox(height: 20),
                    Text(
                      "Peek A Boo!",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Align(
                      alignment: Alignment.center,
                    )
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CupertinoButton.filled(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Previous'),
                      )),
                )
              ],
            )));
  }
}
