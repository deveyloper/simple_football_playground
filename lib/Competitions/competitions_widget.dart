import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpOperations;
import 'package:simple_football_playground/models/Competition.dart';

class CompetitionsWidget extends StatefulWidget {
  @override
  _CompetitionsWidgetState createState() => _CompetitionsWidgetState();
}

class _CompetitionsWidgetState extends State<CompetitionsWidget> {
  Future<List<Competition>> _competitions() async {
    var url = 'http://api.football-data.org/v2/competitions?plan=TIER_ONE';
    var headers = Map<String, String>();
    headers.putIfAbsent(
        "X-Auth-Token", () => "ebcd56f1c1f5407fa3ce9e56496d403a");

    var responseData = await httpOperations.get(url, headers: headers);
    var dynamicData = json.decode(responseData.body);
    CompetitionsResult apiResult = CompetitionsResult.fromJson(dynamicData);
    return apiResult.competitions;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _competitions(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            return ListView(
                children: snapshot.data
                    .map<FlatButton>((s) => FlatButton(
                          child: ListTile(
                              title: Text('${s.area.name} -  ${s.name}')),
                          onPressed: () {
                            print(s.id.toString());
                          },
                        ))
                    .toList());
          } else {
            return ListTile(
              title: Text('Loading!!!'),
            );
          }
        },
      ),
    );
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
