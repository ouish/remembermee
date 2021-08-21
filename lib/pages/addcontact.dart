import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  State<StatefulWidget> createState() {
    return AddContactState();
  }
}

class AddContactState extends State<AddContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Person"),
        backgroundColor: Colors.teal[900],
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.contact_page))
        ],
        centerTitle: true,
        elevation: 6,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    maxLength: 30,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "first name",
                      prefixIcon: Icon(Icons.person_add),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal.shade900)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    maxLength: 30,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "last name",
                      prefixIcon: Icon(Icons.person),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal.shade900)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    maxLength: 30,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "phone number",
                      prefixIcon: Icon(Icons.phone_android),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal.shade900)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    maxLength: 30,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "relative",
                      prefixIcon: Icon(Icons.family_restroom),
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
                    child: Text("Add Image For Person"),
                    style: ElevatedButton.styleFrom(primary: Colors.teal[900]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Add person"),
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
