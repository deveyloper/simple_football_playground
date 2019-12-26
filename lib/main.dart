import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:simple_football_playground/Components/icon_card.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromPath("config/keys.json");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'OpenSans'),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage2(),
    );
  }
}

class HomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          Container(
              color: Colors.yellow,
              alignment: Alignment.center,
              child: Text(
                '1',
                style: TextStyle(fontSize: 30),
              )),
          Container(
              alignment: Alignment.center,
              child: Text(
                '2',
                style: TextStyle(fontSize: 30),
              )),
          Container(
              alignment: Alignment.center,
              child: Text(
                '3',
                style: TextStyle(fontSize: 30),
              ))
        ],
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: PageView(
          children: [
            IconCard(
              color: Colors.orange,
              iconData: Icons.android,
              title: 'Fatih',
              subTitle: 'Developer',
              rate: 5,
            ),
            IconCard(
              color: Colors.green,
              iconData: Icons.android,
              title: 'Fatih Berksöz',
              subTitle: 'Developer',
              rate: 5,
            ),
            IconCard(
              color: Colors.redAccent,
              iconData: Icons.add_to_home_screen,
              title: 'Fatih',
              subTitle: 'Developer',
              rate: 3,
            ),
            IconCard(
              color: Colors.orange,
              iconData: Icons.android,
              title: 'Fatih',
              subTitle: 'Developer',
              rate: 5,
            ),
            IconCard(
              color: Colors.green,
              iconData: Icons.android,
              title: 'Fatih Berksöz',
              subTitle: 'Developer',
              rate: 3,
            ),
            IconCard(
              color: Colors.redAccent,
              iconData: Icons.add_to_home_screen,
              title: 'Fatih',
              subTitle: 'Developer',
              rate: 3,
            )
          ],
        ),
      ),
    ));
  }
}
