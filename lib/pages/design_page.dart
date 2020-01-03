import 'package:flutter/material.dart';

class DesignPage extends StatefulWidget {
  @override
  _DesignPageState createState() => _DesignPageState();
}

class _DesignPageState extends State<DesignPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFFE9F6FF)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 300,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Image.asset('assets/images/ball.png'),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left:15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                                text: 'FOOTBALL',
                                style: TextStyle(
                                    color: Color(0xFF2E396A), fontSize: 30, fontWeight: FontWeight.bold)),
                          ),
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                                text: 'market',
                                style: TextStyle(
                                    color: Color(0xFF2E396A), fontSize: 20, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
