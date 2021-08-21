import 'package:flutter/material.dart';
import '../compount/mydrawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../compount/contalist.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  List Contactlist = [
    {
      "name": "hamzi",
      "lastname": "ouis",
      "number": "0559040975",
      "relation": "son"
    },
    {
      "name": "habibou",
      "lastname": "ouis",
      "number": "0668050301",
      "relation": "brother"
    },
    {
      "name": "asmaa",
      "lastname": "ouis",
      "number": "0772070813",
      "relation": "sister"
    },
    {
      "name": "faiza",
      "lastname": "ouis",
      "number": "0772070813",
      "relation": "daugther"
    },
    {
      "name": "khald",
      "lastname": "hamzi",
      "number": "0772070813",
      "relation": "friend"
    },
    {
      "name": "oussama",
      "lastname": "hamzi",
      "number": "0772070813",
      "relation": "friend"
    },
  ];

  Future getData() async {
    String url = "http://10.0.2.2/rememberbdd/upload/index.php";

    var response = await http.get(Uri.parse(url));
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Phone'),
        backgroundColor: Colors.teal[900],
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.contact_page))
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
          Navigator.of(context).pushNamed("addcontact");
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
                  return Contalist(
                    cname: snapshot.data[i]["r_name"],
                    clastname: snapshot.data[i]['r_firstname'],
                    ctlf: snapshot.data[i]['r_tlf'],
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
