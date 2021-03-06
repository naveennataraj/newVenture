import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Screens/BUFBlitzCanvas/BUFBliztCanvasFramework.dart';

class CongratsBIFDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('dialog');
    return AlertDialog(
      title: new Text(
        "Congratulations!",
      ),
      content: new Text(
          "You have created a product/solution concept using the Blitz Innovation Framework! \n \n"
          "Would you like to view your product dashboard?"),
      actions: <Widget>[
        // usually buttons at the bottom of the dialog

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                FlatButton(
                  child: new Text("HEAD BACK",
                      style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/BlitzInnovationFramework');
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                FlatButton(
                  child: new Text("PROCEED TO THE DASHBOARD",
                      style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/conceptDashboard');
                  },
                ),
              ],
            ),
            FlatButton(
              child: new Text(
                "CREATE A BUSINESS MODEL FOR MY PRODUCT",
                style: TextStyle(
                    color: Color(
                  0XFFE95420,
                )),
              ),
              onPressed: () {
                //Navigator.pushNamed(context, '/BIFCanvas');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BIFCanvasFramework(
                      ),
                    ),);
              },
            ),
          ],
        ),
      ],
    );
  }
}
