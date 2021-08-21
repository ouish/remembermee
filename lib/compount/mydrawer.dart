import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//class MyDrawer extends StatelessWidget {
// @override
//Widget build(BuildContext context) {

// }
//}

class MyDrawer extends StatefulWidget {
  // const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var username;
  var email;
  bool isLogIn = false; //islogin
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (username != Null) {
      setState(() {
        username = preferences.getString("username");
        email = preferences.getString("email");
        isLogIn = true;
      });
    }
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //getPref() async {
    //SharedPreferences preferences.
    //}

    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: isLogIn ? Text(username) : Text(""),
            accountEmail: isLogIn ? Text(email) : Text(""),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/drawer.jpg"), fit: BoxFit.cover)),
          ),
          ListTile(
            title: Text(
              "Home Page",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            leading: Icon(
              Icons.home,
              color: Colors.teal[900],
              size: 25,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('homepage');
            },
          ),
          ListTile(
            title: Text(
              "Contact",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            leading: Icon(
              Icons.contact_phone,
              color: Colors.teal[900],
              size: 25,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('contact');
            },
          ),
          ListTile(
            title: Text(
              "Proches",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            leading: Icon(
              Icons.family_restroom,
              color: Colors.teal[900],
              size: 25,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('relatives');
            },
          ),
          ListTile(
            title: Text(
              "Alarm",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            leading: Icon(
              Icons.alarm,
              color: Colors.teal[900],
              size: 25,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('alarm');
            },
          ),
          ListTile(
            title: Text(
              "Add Alarm",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            leading: Icon(
              Icons.add_alarm,
              color: Colors.teal[900],
              size: 25,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('addalarm');
            },
          ),
          Divider(
            color: Colors.teal[900],
            thickness: 2,
            height: 50,
          ),
          ListTile(
            title: Text(
              "Settings",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            leading: Icon(
              Icons.settings,
              color: Colors.teal[900],
              size: 25,
            ),
          ),
          ListTile(
            title: Text(
              "LogOut",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            leading: Icon(
              Icons.logout,
              color: Colors.teal[900],
              size: 25,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('login');
            },
          ),
        ],
      ),
    );
  }
}
