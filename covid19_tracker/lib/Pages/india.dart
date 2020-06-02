import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:responsive_container/responsive_container.dart';
import './blinking.dart';

class India extends StatefulWidget {
  @override
  _IndiaState createState() => _IndiaState();
}

class _IndiaState extends State<India> {
  var regional;
  int ci = 1;
  bool check = false;

  void getData() async {
    var res = await get("https://api.covid19india.org/data.json");
    setState(() {
      regional = jsonDecode(res.body)["statewise"];
      check = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  List<Center> func() {
    List<Center> torender = [];
    torender.add(
      Center(
        child: ResponsiveContainer(
          heightPercent: 98.0,
          widthPercent: 98.0,
          margin: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "INDIA ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 40.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    BlinkWidget(
                      children: <Widget>[
                        Text(
                          "LIVE",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        Text(" "),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Total Cases - ${regional[0]["confirmed"]}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Active Cases - ${regional[0]['active']}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Total Deaths - ${regional[0]['deaths']}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Recovered - ${regional[0]["recovered"]}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () => {},
                    label: Text("Swipe Left(State Wise Analysis)"),
                    icon: Icon(
                      Icons.arrow_back,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: FlatButton.icon(
                    onPressed: () => {},
                    label: Text("The Source of info is mohfw"),
                    icon: Icon(
                      Icons.warning,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    for (int i = 1; i < regional.length; i++) {
      torender.add(
        Center(
          child: ResponsiveContainer(
            heightPercent: 98.0,
            widthPercent: 98.0,
            margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        regional[i]["state"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 40.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      BlinkWidget(
                        children: <Widget>[
                          Text(
                            "  LIVE",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          Text(" "),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Total Cases - ${regional[i]['confirmed']}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Active Cases - ${regional[i]['active']}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Total Deaths - ${regional[i]['deaths']}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Recovered - ${regional[i]["recovered"]}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 25.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton.icon(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "/dis",
                              arguments: {"state": regional[i]["state"]});
                        },
                        icon: Icon(Icons.navigate_next),
                        color: Colors.grey,
                        label: Text(
                          "District Wise Data",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 20.0,
                          ),
                        ))
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: FlatButton.icon(
                      onPressed: () => {},
                      label: Text("The Source of info is mohfw"),
                      icon: Icon(
                        Icons.warning,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return torender;
  }

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: ResponsiveContainer(
          heightPercent: 99.0,
          widthPercent: 99.0,
          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child: PageView(
              children: !check
                  ? <Widget>[
                      SpinKitFadingCircle(
                        color: Colors.white,
                        size: 70.0,
                      ),
                    ]
                  : func()),
        ),
      ),
    );
  }
}
