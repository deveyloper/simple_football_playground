import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:simple_football_playground/pages/bank_page.dart';
import 'package:simple_football_playground/pages/login_page.dart';

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
    int distance = (index - bottomTapIndex).abs();
    setState(() {
      bottomTapIndex = index;
      controller.animateToPage(index,
          duration: Duration(milliseconds: 500 * distance), curve: Curves.ease);
    });
  }

  void pageChanged(int index) {
    setState(() {
      bottomTapIndex = index;
    });
  }

  void loginPressed(){
    bottomTapped(1);
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
            backgroundColor: Color(0xCC1B3F22),
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
          body: _getPageView(),
          bottomNavigationBar: _getBottomNavigationBar(),
        ),
      ),
    );
  }

  PageView _getPageView() {
    return PageView(
      children: <Widget>[
        LoginPage(onPressedCallBack: loginPressed,),
        BankPage(),
        CompetitionsWidget(),
      ],
      onPageChanged: (index) {
        pageChanged(index);
      },
      scrollDirection: Axis.vertical,
      controller: controller,
    );
  }

  BottomNavigationBar _getBottomNavigationBar() {
    return BottomNavigationBar(
        backgroundColor: Color(0xFF1B3F22),
        selectedLabelStyle: TextStyle(color: Colors.black, fontSize: 22),
        selectedIconTheme: IconThemeData(color: Colors.yellow, size: 35),
        showSelectedLabels: true,
        onTap: (index) {
          bottomTapped(index);
        },
        currentIndex: bottomTapIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white38, size: 25),
            title: Text(
              'Login',
              style: TextStyle(color: Colors.white38, fontSize: 15),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money, color: Colors.white38, size: 25),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.white38, fontSize: 15),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart, color: Colors.white38, size: 25),
            title: Text(
              'League',
              style: TextStyle(color: Colors.white38, fontSize: 15),
            ),
          ),
        ]);
  }
}
