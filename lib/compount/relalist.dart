import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Relalist extends StatelessWidget {
  final rname;
  final rlastname;
  final rrelation;
  Relalist({this.rname, this.rrelation, this.rlastname});

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
                              rname,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              rlastname,
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
                          rrelation,
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
                child: Icon(
                  Icons.edit,
                  color: Colors.teal[900],
                  size: 40,
                ),
              ),
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
          desc: 'do you want to delete the person',
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
