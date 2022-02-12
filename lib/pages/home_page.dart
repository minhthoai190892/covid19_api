import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:covid19_api/models/covid19.dart';
import 'package:covid19_api/widgets/covid19_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  late Covid19 dataCovid19;

  Future getCovid19() async {
    var response = await http.get(Uri.parse("https://covid19.mathdro.id/api"));
    Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;
    dataCovid19 = Covid19.fromJson(data);
    print(dataCovid19.confirmed.detail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Covid - 19"),
        ),
        body: ListView(
          children: [
            FutureBuilder(
              future: getCovid19(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Text("Loading data ..."),
                  );
                }
                return Column(
                  children: [
                    CovidItem("CONFIRMED", "${dataCovid19.confirmed.value}"),
                    CovidItem("DEATHS", "${dataCovid19.deaths.value}"),
                    CovidItem("lastUpdate",
                        "${DateFormat.yMMMMd().format(dataCovid19.lastUpdate)}")
                  ],
                );
              },
            ),
          ],
        ));
  }
}
