import 'package:flutter/material.dart';
import '../compount/mydrawer.dart';
import '../compount/alalist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Alarm extends StatefulWidget {
  //final id; //z
  //Alarm({this.id}); //z
  State<StatefulWidget> createState() {
    return AlarmState();
  }
}

class AlarmState extends State<Alarm> {
  //List Contactlist = [
  //{"name": "mohamed", "heur": "12:00pm", "remarque": "2 dose"},
  // {"name": "habibou", "heur": "7:00pm", "remarque": ""},
  // {"name": "ouis", "heur": "10:00pm", "remarque": ""},
  // {"name": "mohamed", "heur": "12:00pm", "remarque": "1 dose"},
  // {"name": "habibou", "heur": "7:00pm", "remarque": ""},
  // {"name": "ouis", "heur": "10:00pm", "remarque": ""},
  // ];

  Future getData() async {
    String url = "http://10.0.2.2/rememberbdd/upload/index1.php";
    //z
    var response = await http.get(Uri.parse(url)); //z  rod get wegla3 body
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Alarm List"),
          backgroundColor: Colors.teal[900],
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.alarm))
          ],
          centerTitle: true,
          elevation: 6,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 25,
          ),
          backgroundColor: Colors.teal[900],
          onPressed: () {
            Navigator.of(context).pushNamed("addalarm");
          },
        ),
        drawer: MyDrawer(),
        body: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return Alalist(
                      aname: snapshot.data[i]['a_name'],
                      aheur: snapshot.data[i]['a_heur'],
                      aremarque: snapshot.data[i]['a_remarque'],
                    );
                  });
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
