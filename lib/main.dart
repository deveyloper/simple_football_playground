import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:simple_football_playground/Components/icon_card.dart';

import 'Competitions/competitions_widget.dart';

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
      home: Scaffold(
        body: ListView(
          children: [
            IconCard(
              color: Colors.orange,
              iconData: Icons.android,
              title: 'Fatih',
              subTitle: 'Developer',
              rate: 3,
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
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Competitions"),
          backgroundColor: Colors.blueGrey.shade900,
        ),
        body: CompetitionsWidget(),
      ),
    );
  }
}
