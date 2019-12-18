import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:simple_football_playground/Utility/ApiUtility.dart';
import 'package:simple_football_playground/models/ApiResult.dart';
import 'package:simple_football_playground/models/Competition.dart';
import 'package:simple_football_playground/models/TableData.dart';

class LeagueTable extends StatefulWidget {
  LeagueTable({Key key, this.competition}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final Competition competition;

  @override
  _LeagueTableState createState() => _LeagueTableState(this.competition);
}

class _LeagueTableState extends State<LeagueTable> {
  Competition competition;

  _LeagueTableState(this.competition);

  Future<List<TableData>> test() async {
    var url =
        'http://api.football-data.org/v2/competitions/${competition.id}/standings';
    var responseData = await ApiUtility().get(url);
    var dynamicData = json.decode(responseData.body);
    ApiResult apiResult = ApiResult.fromJson(dynamicData);
    return apiResult.standings[0].table;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(competition.name),
      ),
      body: FutureBuilder(
          future: test(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Row(children: [
                    Expanded(
                        flex: 5,
                        child: Text("Team", style: TextStyle(fontSize: 15))),
                    Expanded(
                        flex: 1,
                        child: Text("Won", style: TextStyle(fontSize: 15))),
                    Expanded(
                        flex: 1,
                        child: Text("Draw", style: TextStyle(fontSize: 15))),
                    Expanded(
                        flex: 1,
                        child: Text("Lost", style: TextStyle(fontSize: 15))),
                    Expanded(
                        flex: 1,
                        child: Text("Points", style: TextStyle(fontSize: 15))),
                  ]),
                ),
                Expanded(
                  flex: 15,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: snapshot.connectionState ==
                                  ConnectionState.done &&
                              snapshot.data != null
                          ? snapshot.data
                              .map<Row>((tableData) => Row(children: <Widget>[
                                    Expanded(
                                      flex: 5,
                                      child: Text(tableData.team.name,
                                          style: TextStyle(fontSize: 15)),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(tableData.won.toString(),
                                          style: TextStyle(fontSize: 15)),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(tableData.draw.toString(),
                                          style: TextStyle(fontSize: 15)),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(tableData.lost.toString(),
                                          style: TextStyle(fontSize: 15)),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(tableData.points.toString(),
                                          style: TextStyle(fontSize: 15)),
                                    )
                                  ]))
                              .toList()
                          : [CircularProgressIndicator()],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
