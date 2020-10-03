import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import './blinking.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data = [];

  void getData() async {
    var res = await get("https://coronavirus-19-api.herokuapp.com/countries");
    setState(() {
      data = jsonDecode(res.body);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  List<Center> pages() {
    List<Center> torender = [];
    for (int i = 0; i < data.length; i++) {
      if (data[i]["country"].length == 0) {
        continue;
      } else {
        torender.add(
          Center(
            child: ResponsiveContainer(
              heightPercent: 99.0,
              widthPercent: 99.0,
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          data[i]["country"],
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
                        "Total Cases - ${data[i]['cases']}",
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
                        "New Cases - ${data[i]['todayCases']}",
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
                        "Total Deaths - ${data[i]['deaths']}",
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
                        "Deaths Today - ${data[i]["todayDeaths"]}",
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
                        "Recovered - ${data[i]["recovered"]}",
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
                        label: Text("Swipe Left(Country Wise Analysis)"),
                        icon: Icon(
                          FontAwesomeIcons.arrowCircleLeft,
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
      }
    }
    return torender;
  }

  int ci = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF0A0E20),
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
                          color: Colors.yellow,
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
              ),
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
          margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
          child: PageView(
              children: data.length == 0
                  ? <Widget>[
                      SpinKitFadingCircle(
                        color: Colors.white,
                        size: 70.0,
                      ),
                    ]
                  : pages()),
        ),
      ),
    );
  }
}
