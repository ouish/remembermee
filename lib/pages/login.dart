import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  //Login({Key key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

showdialog(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [Text("loading...."), CircularProgressIndicator()],
          ),
        );
      });
}

showdialogall(context, String mytitle, String mycontent) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(mytitle),
          content: Text(mycontent),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("done"),
            )
          ],
        );
      });
}

class _LoginState extends State<Login> {
  //bool isloading = false;

  // start form controler
  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  GlobalKey<FormState> formstatelogin = new GlobalKey<FormState>();

  savePref(String username, String email, String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("id", id);
    preferences.setString("username", username);
    preferences.setString("email", email);
    print(preferences.getString("username"));
    print(preferences.getString("email"));
    print(preferences.getString("id"));
  }

  login() async {
    var formdata = formstatelogin.currentState;
    if (formdata!.validate()) {
      formdata.save();
      //setState(() {
      // isloading = true;
      // });
      showdialog(context);
      var data = {"email": email.text, "password": password.text};
      var url = "http://10.0.2.2/rememberbdd/upload/login.php";
      var response = await http.post(Uri.parse(url), body: data);
      var responsebody = jsonDecode(response.body);
      if (responsebody['status'] == "success") {
        savePref(responsebody['username'], responsebody['email'],
            responsebody['id']);
        // print(responsebody['username']);
        Navigator.of(context).pushNamed('homepage');
      } else {
        print("login faild");
        //setState(() {
        //isloading = false;
        // });
        // if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
        showdialogall(context, "false", "email or password fals");
        //  }
      }
    } else {
      print("not valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.asset(
                    "images/2.png",
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              )),
              Container(
                padding: EdgeInsets.all(20),
                child: Form(
                    key: formstatelogin,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined),
                              hintText: "email",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: password,
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password_outlined),
                              hintText: "password",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1))),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text("if you don't have account "),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed("signin");
                                },
                                child: Text(
                                  "Click Here",
                                  style: TextStyle(color: Colors.teal[900]),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: ElevatedButton(
                            onPressed: login,
                            // () {
                            // Navigator.of(context).pushNamed("homepage");
                            // },
                            child: Text("login"),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.teal[900],
                            ),
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
