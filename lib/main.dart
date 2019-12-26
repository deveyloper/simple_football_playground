import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:simple_football_playground/pages/bank_page.dart';
import 'package:simple_football_playground/pages/developer_cards.dart';

import 'Competitions/competitions_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromPath("config/keys.json");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PageController controller = PageController(initialPage: 0, keepPage: true);
  int bottomTapIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  void bottomTapped(int index) {
    setState(() {
      bottomTapIndex = index;
      controller.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  void pageChanged(int index) {
    setState(() {
      bottomTapIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF12B59A),
            leading: Icon(Icons.view_headline),
            title: Text(
              'Simple Football',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(Icons.alarm),
              ),
            ],
          ),
          body: PageView(
            children: <Widget>[
              BankPage(),
              CompetitionsWidget(),
              Container(color: Colors.blue)
            ],
            onPageChanged: (index) {
              pageChanged(index);
            },
            scrollDirection: Axis.horizontal,
            controller: controller,
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              bottomTapped(index);
            },
            currentIndex: bottomTapIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Search'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                title: Text('Calendar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
