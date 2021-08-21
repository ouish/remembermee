import 'package:flutter/material.dart';
import '../compount/alalist.dart';

class Alarmdtails extends StatefulWidget {
  final anamed;
  final aheurd;
  final aremarqued;
  Alarmdtails({this.anamed, this.aheurd, this.aremarqued});
  @override
  _AlarmdtailsState createState() => _AlarmdtailsState();
}

class _AlarmdtailsState extends State<Alarmdtails> {
  List Contactlist = [
    {
      "name": "mohammed",
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
      "relation": "grand_daugther"
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alarm Details'),
        backgroundColor: Colors.teal[900],
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.book_online))
        ],
        centerTitle: true,
        elevation: 6,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: GridTile(
              child: Image.asset(
                "images/8.png",
                fit: BoxFit.cover,
              ),
              footer: Container(
                height: 70,
                color: Colors.black.withOpacity(0.3),
                // alignment: Alignment.center,
              ),
            ),
          ),
          // end head page
          Container(
            width: double.infinity,
            color: Colors.grey[300],
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          widget.anamed,
                          style: TextStyle(
                              color: Colors.teal[900],
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          widget.aheurd,
                          style: TextStyle(
                              color: Colors.teal[900],
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ))
                    ],
                  ),
                ),
                Divider(
                  color: Colors.teal[900],
                  thickness: 2,
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.grey[300],
                  child: Text(
                    "Remarque:",
                    style: TextStyle(
                      color: Colors.teal[900],
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: widget.aremarqued,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
