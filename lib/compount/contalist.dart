import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Contalist extends StatelessWidget {
  final cname;
  final clastname;
  final ctlf;
  Contalist({this.cname, this.ctlf, this.clastname});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 80,
        width: 100,
        child: Card(
          color: Colors.grey[300],
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: ClipOval(
                    child: Image(
                      image: AssetImage("images/6.png"),
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  )),
              Expanded(
                flex: 2,
                child: Container(
                    alignment: Alignment.topLeft,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: [
                            Text(
                              cname,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              clastname,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          ctlf,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.teal[900]),
                        ),
                      ],
                    )),
              ),
              Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.phone,
                      color: Colors.teal[900],
                      size: 40,
                    ),
                  )),
            ],
          ),
        ),
      ),
      onTap: () {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.WARNING,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Dialog Title',
          desc: 'do you want to delete the contact',
          btnCancelOnPress: () {},
          btnOkOnPress: () {},
        )..show();
      },
      // onTap: () {
      // print("3aytli");
      // },
    );
  }
}
