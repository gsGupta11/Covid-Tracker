import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class District extends StatefulWidget {
  @override
  _DistrictState createState() => _DistrictState();
}

class _DistrictState extends State<District> {
  var state;
  var data;
  bool check = false;
  int ci = 1;
  void getData() async {
    var res =
        await get("https://api.covid19india.org/state_district_wise.json");
    setState(() {
      data = jsonDecode(res.body);
      check = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  List<Container> dis() {
    List<Container> ren = [];
    var torender = data[state]["districtData"];
    for (String i in torender.keys) {
      ren.add(
        Container(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          child: Card(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: ListTile(
                leading: Icon(
                  Icons.add_box,
                  color: Colors.red,
                  size: 50.0,
                ),
                title: Text(
                  "${i}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                subtitle: Text(
                  "Total Confirmed Cases are - ${torender[i]["confirmed"]}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
    ren.add(Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: RaisedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, "/india");
        },
        child: Text("Back"),
      ),
    ));
    return ren;
  }

  @override
  Widget build(BuildContext context) {
    state = ModalRoute.of(context).settings.arguments;
    state = state["state"];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text(
          "COVID-19 TRACKER",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.red[800],
            fontWeight: FontWeight.w700,
            fontSize: 25.0,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(
          margin: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.supervised_user_circle,
                      color: Colors.red,
                      size: 180.0,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "COVID 19",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 30.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Alert!",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 25.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
              Divider(
                height: 40.0,
                color: Colors.white,
                thickness: 3.0,
              ),
              Text("Preventions",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  )),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      subtitle: Text(
                        "Wash your hand often",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      subtitle: Text(
                        "Wear a Face Mask",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      subtitle: Text(
                        "Avoid Contact with sick people",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      onTap: () {},
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                      child: ListTile(
                        subtitle: Text(
                          "Always cover while coughing and sneezing",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ci,
        selectedItemColor: Colors.green,
        backgroundColor: Colors.black12,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.system_update_alt),
            title: Text("India Stats"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sentiment_satisfied),
            title: Text("Suggestions"),
          ),
        ],
        onTap: (index) {
          setState(() {
            ci = index;
          });
          if (index == 0) {
            Navigator.pushReplacementNamed(context, "/");
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, "/india");
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, "/form");
          }
        },
      ),
      body: Container(
        child: ListView(
            children: !check
                ? <Widget>[
                    SpinKitFadingCircle(
                      color: Colors.white,
                      size: 70.0,
                    ),
                  ]
                : dis()),
      ),
    );
  }
}
