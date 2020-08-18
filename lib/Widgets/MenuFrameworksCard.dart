import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/ContentFrameworkMenu.dart';
import 'package:iventure001/Widgets/SpaceHeight20.dart';
import 'package:iventure001/Widgets/SpaceHeight30.dart';

class MenuFrameworkCard extends StatelessWidget {
  final ContentFrameworkMenu menuContent;
  MenuFrameworkCard(this.menuContent);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 650,
        decoration: BoxDecoration(
          color: Colors.white,
          //shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 2.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                menuContent.title,
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
              Space20(),
              Text(
                menuContent.paragraph1,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              Space20(),
              Text(
                menuContent.paragraph2,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              Space30(),
              ReusableButton(
                  buttonTitle: 'Let\'s ideate and create a product concept :)',
                  buttonPushView: '/BlitzInnovationFramework'),
              ReusableButton(
                  buttonTitle:
                      'I already have a product idea in mind. Let\'s create a business model around it :)',
                  buttonPushView: '/BCHomeView'),
              ReusableButton(
                  buttonTitle:
                      'I just starting out. Let\'s create a startup from scratch :)',
                  buttonPushView: '/BusinessModelDashboard'),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableButton extends StatelessWidget {
  ReusableButton({@required this.buttonTitle, this.buttonPushView});
  final String buttonTitle;
  final String buttonPushView;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 5,
      hoverElevation: 10,
      color: Color(0XFFE95420),
      onPressed: () {
        Navigator.pushNamed(context, buttonPushView);
      },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          buttonTitle,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
