import 'package:flutter/material.dart';
import 'package:remembermee/pages/alarmdetails.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Alalist extends StatelessWidget {
  final aname;
  final aheur;
  final aremarque;
  Alalist({this.aname, this.aheur, this.aremarque});
  @override
  Widget build(BuildContext context) {
    return //start list
        InkWell(
      child: Container(
        height: 100,
        width: 100,
        child: Card(
          color: Colors.grey[300],
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Image(
                      image: AssetImage(
                        "images/8.png",
                      ),
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // InkWell(
              // child:
              Expanded(
                flex: 2,
                child: Container(
                    alignment: Alignment.topLeft,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          aname,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          aheur,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.teal[900]),
                        ),
                      ],
                    )),
              ),
              //edit note
              // onTap: () {
              // AwesomeDialog(
              //  context: context,
              //  dialogType: DialogType.INFO,
              //  animType: AnimType.BOTTOMSLIDE,
              //  title: 'Dialog Title',
              //  desc: 'Dialog description here.............',
              //  btnCancelOnPress: () {},
              //   btnOkOnPress: () {},
              //   )..show();
              //  },
              //end edit note
              // dlete note
              //    onLongPress: () {},
              //end dlete note
              // ),
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Alarmdtails(
                          anamed: aname, aheurd: aheur, aremarqued: aremarque);
                    }));
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.teal[900],
                    size: 25,
                  ),
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
          desc: 'do you want to delete the note',
          btnCancelOnPress: () {},
          btnOkOnPress: () {},
        )..show();
      },

      //onTap: () {
      //Navigator.of(context).pushNamed("alarmdetails");
      // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      //return Alarmdtails(
      //  anamed: aname, aheurd: aheur, aremarqued: aremarque);
      //  }));
      // },
    );
    //end list
  }
}
