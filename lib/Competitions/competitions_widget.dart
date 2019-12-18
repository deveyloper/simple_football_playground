import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpOperations;
import 'package:simple_football_playground/Common/Result.dart';
import 'package:simple_football_playground/LeagueTable/league_table.dart';
import 'package:simple_football_playground/Utility/ApiUtility.dart';
import 'package:simple_football_playground/models/Competition.dart';

class CompetitionsWidget extends StatefulWidget {
  @override
  _CompetitionsWidgetState createState() => _CompetitionsWidgetState();
}

class _CompetitionsWidgetState extends State<CompetitionsWidget> {
  List<Competition> _competitions = [];
  bool isLoading = true;

  Future _competitionList() async {
    var url = 'http://api.football-data.org/v2/competitions?plan=TIER_ONE';

    Result<httpOperations.Response> result = await ApiUtility().get(url);
    if (result.isSuccessful) {
      var dynamicData = json.decode(result.data.body);
      print(dynamicData);
      CompetitionsResult apiResult = CompetitionsResult.fromJson(dynamicData);
      setState(() {
        isLoading = false;
        _competitions = apiResult.competitions;
      });
    }
  }

  @override
  void initState() {
    _competitionList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueGrey,
        child: ListView(
            children: isLoading
                ? [
                    ListTile(
                      title: Text("Loading!!"),
                    )
                  ]
                : _competitions
                    .map<FlatButton>((s) => FlatButton(
                          child: ListTile(
                              title: Text('${s.area.name} -  ${s.name}')),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        LeagueTable(competition: s)));
                          },
                        ))
                    .toList()));
  }
}

class CompetitionsResult {
  List<Competition> competitions;
  CompetitionsResult(this.competitions);

  CompetitionsResult.fromJson(Map<String, dynamic> json) {
    if (json["competitions"] != null) {
      competitions = new List<Competition>();
      json["competitions"].forEach((c) {
        competitions.add(new Competition.fromJson(c));
      });
    }
  }
}
