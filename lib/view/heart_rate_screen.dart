import 'package:flutter/material.dart';

class HeartRateScreen extends StatelessWidget {
  static const String routeName = 'heart';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.center,
                    height: 150,
                    width: 130,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('asset/images/heart.png'),
                        fit: BoxFit.fill,
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  args.toString(),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'beats per minute',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          )),
    );
  }
}
