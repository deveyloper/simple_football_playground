import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:simple_football_playground/Utility/ApiUtility.dart';
import 'package:simple_football_playground/models/ApiResult.dart';
import 'package:simple_football_playground/models/Competition.dart';
import 'package:simple_football_playground/models/TableData.dart';

class LeagueTableList extends StatefulWidget {
  LeagueTableList({Key key, this.competition}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final Competition competition;

  @override
  _LeagueTableListState createState() =>
      _LeagueTableListState(this.competition);
}

class _LeagueTableListState extends State<LeagueTableList> {
  Competition competition;

  _LeagueTableListState(this.competition);

  List<TableData> _tableData = [];
  bool isLoading = false;

  Future _tableDataList() async {
    var url =
        'http://api.football-data.org/v2/competitions/${competition.id}/standings';
    var result = await ApiUtility().get(url);
    if (result.isSuccessful) {
      var dynamicData = json.decode(result.data.body);
      ApiResult apiResult = ApiResult.fromJson(dynamicData);
      setState(() {
        isLoading = false;
        _tableData = apiResult.standings[0].table;
      });
    }
  }

  @override
  void initState() {
    _tableDataList();
    super.initState();
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
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[Text("Team Name")],
              ),
            )
          ],
        ));
  }
}
