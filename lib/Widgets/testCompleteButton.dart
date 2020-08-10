import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const userUid = "tester@gmail.com";

class CompleteStepButton extends StatelessWidget {
  final _firestore = Firestore.instance;

  final String routeName;
  final bool stepBool;
  final int step;
  final Future widget;
  //final bcStepsContent;
  //final ID;

  CompleteStepButton({this.routeName, this.stepBool, this.step, this.widget });
 bool bcStepsContent0;

  void switchStep(){

    switch(step){

      case 0 :
        _firestore.collection(userUid).document('stepValidation').updateData({
          if(stepBool == true)
          'bcStepsContent0': true
          else if ((stepBool == false)) // if the user did not finish the step
            'bcStepsContent0': false
        });
        break;

      case 1 :
        _firestore.collection(userUid).document('stepValidation').updateData({
          if(stepBool == true)
            'bcStepsContent1': true
          else if ((stepBool == false)) // if the user did not finish the step
            'bcStepsContent1': false
        });
        break;

      case 2 :
        _firestore.collection(userUid).document('stepValidation').updateData({
          if(stepBool == true)
            'bcStepsContent2': true
          else if ((stepBool == false)) // if the user did not finish the step
            'bcStepsContent2': false
        });
        break;

      case 3 :
        _firestore.collection(userUid).document('stepValidation').updateData({
          if(stepBool == true)
            'bcStepsContent3': true
          else if ((stepBool == false)) // if the user did not finish the step
            'bcStepsContent3': false
        });
        break;

      case 4 :
        _firestore.collection(userUid).document('stepValidation').updateData({
          if(stepBool == true)
            'bcStepsContent4': true
          else if ((stepBool == false)) // if the user did not finish the step
            'bcStepsContent4': false
        });
        break;

      case 5 :
        _firestore.collection(userUid).document('stepValidation').updateData({
          if(stepBool == true)
            'bcStepsContent5': true
          else if ((stepBool == false)) // if the user did not finish the step
            'bcStepsContent5': false
        });
        break;

      case 6 :
        _firestore.collection(userUid).document('stepValidation').updateData({
          if(stepBool == true)
            'bcStepsContent6': true
          else if ((stepBool == false)) // if the user did not finish the step
            'bcStepsContent6': false
        });
        break;

      case 7 :
        _firestore.collection(userUid).document('stepValidation').updateData({
          if(stepBool == true)
            'bcStepsContent7': true
          else if ((stepBool == false)) // if the user did not finish the step
            'bcStepsContent7': false
        });
        break;
      case 8 :
        _firestore.collection(userUid).document('stepValidation').updateData({
          if(stepBool == true)
            'bcStepsContent8': true
          else if ((stepBool == false)) // if the user did not finish the step
            'bcStepsContent8': false
        });
        break;

      case 9 :
        _firestore.collection(userUid).document('stepValidation').updateData({
          if(stepBool == true)
            'bcStepsContent9': true
          else if ((stepBool == false)) // if the user did not finish the step
            'bcStepsContent9': false
        });
        break;

      default :
        print('Number Not Found');

    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
        switchStep();
        

      },

      child: Text(
        'COMPLETE STEP',
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
      ),
    );
  }
}

//
//class CompleteStepButton extends StatefulWidget {
//  CompleteStepButton({this.routeName});
//  final String routeName;
//  //final bool stepValidation;
//
//  @override
//  _CompleteStepButtonState createState() => _CompleteStepButtonState();
//}
//
//class _CompleteStepButtonState extends State<CompleteStepButton> {
//  final _firestore = Firestore.instance;
//  final String routeName;
//  _CompleteStepButtonState({this.routeName});
//
//  @override
//  Widget build(BuildContext context) {
//    return GestureDetector(
//      onTap: () {
//        Navigator.pushNamed(context, routeName);
//      },
//
//      child: Text(
//        'COMPLETE STEP',
//        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
//      ),
//    );
//  }
//}
