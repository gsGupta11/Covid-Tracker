import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Suggest extends StatefulWidget {
  @override
  _SuggestState createState() => _SuggestState();
}

class _SuggestState extends State<Suggest> {
  int ci = 2;
  RegExp r = new RegExp(r"^[0-9]{10}$");
  bool saved = false;
  TextEditingController name = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController suggest = TextEditingController();

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF0A0E20),
        title: Text(
          "COVID-19 TRACKER",
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
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  )),
              Expanded(
                flex: 2,
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
        child: Form(
          key: formkey,
          child: Container(
            padding: EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Align(
                    child: saved
                        ? Text(
                            "Your Response has been successfully saved.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Text(' '),
                    alignment: Alignment.topCenter,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                  child: TextFormField(
                    controller: name,
                    validator: (value) =>
                        value.isEmpty ? "Name field cannot be Empty" : null,
                    autocorrect: true,
                    autofocus: true,
                    maxLength: 50,
                    decoration: InputDecoration(
                      labelText: "Name",
                      hintText: "Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                  child: TextFormField(
                    controller: mail,
                    validator: (value) => value.isEmpty
                        ? "Email Addresss field cannot be Empty"
                        : null,
                    autocorrect: true,
                    autofocus: true,
                    maxLength: 50,
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      hintText: "abc@gmail.com",
                      helperText: "abc@gmail.com",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                  child: TextFormField(
                    autocorrect: true,
                    autofocus: true,
                    maxLength: 10,
                    controller: mobile,
                    validator: (value) => r.hasMatch(value)
                        ? null
                        : "Mobile Number Should contain 10 Numbers",
                    decoration: InputDecoration(
                      labelText: "Mobile No.",
                      hintText: "9540032125",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                  height: 200.0,
                  child: TextFormField(
                    controller: suggest,
                    validator: (value) => value.isEmpty
                        ? "Suggestion field cannot be Empty"
                        : null,
                    autocorrect: true,
                    autofocus: true,
                    maxLines: 15,
                    maxLength: 500,
                    decoration: InputDecoration(
                      labelText: "Suggestions",
                      hintText: "Give Suggestion and Report Bugs",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                  ),
                ),
                RaisedButton(
                  child: Text("Submit"),
                  onPressed: () {
                    if (formkey.currentState.validate()) {
                      setState(() {
                        saved = true;
                      });
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
