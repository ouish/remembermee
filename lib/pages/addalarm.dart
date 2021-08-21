import 'package:flutter/material.dart';
import '../compount/mydrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddAlarm extends StatefulWidget {
  State<StatefulWidget> createState() {
    return AddAlarmState();
  }
}

class AddAlarmState extends State<AddAlarm> {
  var id;

  TextEditingController aname = new TextEditingController();
  TextEditingController aheur = new TextEditingController();
  TextEditingController aremarque = new TextEditingController();
  //var data = {
  //"a_name": aname.text,
  //"a_heur": aheur.text,
  // "a_remarque": aremarque.text
  // };

  Future addalarm() async {
    var url = "http://10.0.2.2/rememberbdd/upload/addalarm.php";
    var data = {
      "aname": aname.text,
      "aheur": aheur.text,
      "aremarque": aremarque.text,
      "id": id
    };
    var response = await http.post(Uri.parse(url), body: data);
    Navigator.of(context).pushNamed("addalarm");
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      id = preferences.getString("id");
    });
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Alarm"),
        backgroundColor: Colors.teal[900],
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.add_alarm))
        ],
        centerTitle: true,
        elevation: 6,
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          Column(
            children: [
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    controller: aname,
                    maxLength: 30,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "title note",
                      prefixIcon: Icon(Icons.note),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal.shade900)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: aheur,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "heur",
                      prefixIcon: Icon(Icons.hourglass_bottom),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal.shade900)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: aremarque,
                    minLines: 1,
                    maxLines: 5,
                    maxLength: 500,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "note",
                      prefixIcon: Icon(Icons.note),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal.shade900)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showBottomSheet();
                    },
                    child: Text("Add Image For Note"),
                    style: ElevatedButton.styleFrom(primary: Colors.teal[900]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: addalarm,
                    child: Text("Add Note"),
                    style: ElevatedButton.styleFrom(primary: Colors.teal[900]),
                  ),
                ],
              ))
            ],
          ),
        ],
      ),
    );
  }

  showBottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(20),
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "please choose image",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(Icons.photo_album_outlined,
                            size: 30, color: Colors.teal[900]),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "From Gallery",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.photo_camera,
                          size: 30,
                          color: Colors.teal[900],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "From Camera",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
