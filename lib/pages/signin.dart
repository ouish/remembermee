import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
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

class _SigninState extends State<Signin> {
  // start form controler
  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  GlobalKey<FormState> formstatesignin = new GlobalKey<FormState>();

  signin() async {
    var formdata = formstatesignin.currentState;
    if (formdata!.validate()) {
      formdata.save();
      showdialog(context);
      var data = {
        "email": email.text,
        "password": password.text,
        "username": username.text
      };
      var url = "http://10.0.2.2/rememberbdd/upload/signin.php";
      var response = await http.post(Uri.parse(url), body: data);
      var responsebody = jsonDecode(response.body);
      if (responsebody['status'] == "success") {
        print(responsebody['yes success']);
        Navigator.of(context).pushNamed('homepage');
      } else {
        print("status");
        Navigator.of(context).pop();
        showdialogall(context, "false", "email alredy exists");
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
                    key: formstatesignin,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: username,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: "username",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
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
                              Text("if you have account "),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed("login");
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
                            onPressed: signin, //() {
                            // Navigator.of(context).pushNamed("homepage");
                            // },
                            child: Text("Signin"),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.teal[900]),
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
