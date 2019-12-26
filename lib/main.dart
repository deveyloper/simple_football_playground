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
          body: PageView(
            children: <Widget>[
              BankPage(),
              CompetitionsWidget(),
              Container(
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.network(
                        'https://images.unsplash.com/photo-1569243963117-78bb6e7ff948?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1568274602483-355d7fbba69c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjQzMzEwfQ&auto=format&fit=crop&w=1955&q=80'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          enabled: false,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Colors.white70,
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                              hintText: 'E-Mail',
                              hintStyle: TextStyle(color: Colors.white),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(50),
                              )),
                          autofocus: false,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          enabled: false,
                          decoration: InputDecoration(
                              prefixIcon:
                                  Icon(Icons.vpn_key, color: Colors.white70),
                              filled: true,
                              fillColor: Colors.transparent,
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.white),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(50),
                              )),
                          autofocus: false,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: MaterialButton(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              onPressed: () {},
                              child: Text(
                                "LOG IN",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
            onPageChanged: (index) {
              pageChanged(index);
            },
            scrollDirection: Axis.horizontal,
            controller: controller,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color(0xFF1B3F22),
            selectedItemColor: Colors.yellow,
            selectedLabelStyle: TextStyle(color: Colors.white, fontSize:20),
            onTap: (index) {
              bottomTapped(index);
            },
            currentIndex: bottomTapIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.attach_money, color: Colors.white38),
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.white38, fontSize: 15),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.table_chart, color: Colors.white38),
                title: Text(
                  'League',
                  style: TextStyle(color: Colors.white38, fontSize: 15),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.white38),
                title: Text(
                  'Login',
                  style: TextStyle(color: Colors.white38, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
