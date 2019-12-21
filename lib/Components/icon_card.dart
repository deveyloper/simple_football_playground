import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  final int rate;
  final IconData iconData;
  final String title;
  final String subTitle;
  final Color color;

  IconCard({this.title, this.subTitle, this.rate, this.iconData, this.color});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            title,
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            subTitle,
                            style: TextStyle(color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                rate, (index) => Icon(Icons.star)),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Read More',
                              style: TextStyle(color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black54),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    'assets/images/boy.png',
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
