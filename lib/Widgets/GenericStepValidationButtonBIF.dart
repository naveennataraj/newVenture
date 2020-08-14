import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';

class GenericStepButtonBIF extends StatefulWidget {
  final String routeName;
  final bool stepBool;
  final int step;
  final Function widget;
  final String buttonName;
  const GenericStepButtonBIF(
      {this.routeName,
      this.stepBool,
      this.step,
      this.widget,
      @required this.buttonName});
  @override
  _GenericStepButtonBIFState createState() =>
      _GenericStepButtonBIFState(routeName, stepBool, step, buttonName);
}

class _GenericStepButtonBIFState extends State<GenericStepButtonBIF> {
  final _firestore = Firestore.instance;
  String routeName;
  bool stepBool;
  int step;
  String buttonName;
  bool firebaseStep0;
  bool firebaseStep1;
  bool firebaseStep2;
  bool firebaseStep3;
  bool firebaseStep4;
  bool firebaseStep5;
  bool firebaseStep6;
  bool firebaseStep7;

  void initState() {
    super.initState();
    getDocuments();
  }

  void getDocuments() async {
    final document = await _firestore
        .collection(currentUser)
        .document('stepValidationInnovationFramework')
        .get();
    if (document.exists) {
      try {
        setState(() {
          firebaseStep0 = document.data['bcStepsContent0'];
          firebaseStep1 = document.data['bcStepsContent1'];
          firebaseStep2 = document.data['bcStepsContent2'];
          firebaseStep3 = document.data['bcStepsContent3'];
          firebaseStep4 = document.data['bcStepsContent4'];
          firebaseStep5 = document.data['bcStepsContent5'];
          firebaseStep6 = document.data['bcStepsContent6'];
          firebaseStep7 = document.data['bcStepsContent7'];
        });
      } catch (e) {
        print(e);
      }
    } else {
      _firestore
          .collection(currentUser)
          .document('stepValidationInnovationFramework')
          .setData({});
    }
  }

  void switchStep() {
    switch (step) {
      case 0:
        if (stepBool == false) {
          if (firebaseStep0 != true)
            _firestore
                .collection(currentUser)
                .document('stepValidationInnovationFramework')
                .updateData({'bcStepsContent0': stepBool});
        } else if (stepBool == true)
          _firestore
              .collection(currentUser)
              .document('stepValidationInnovationFramework')
              .updateData({'bcStepsContent0': true});

        break;

      case 1:
        if (stepBool == false) {
          if (firebaseStep1 != true)
            _firestore
                .collection(currentUser)
                .document('stepValidationInnovationFramework')
                .updateData({'bcStepsContent1': stepBool});
        } else if (stepBool == true)
          _firestore
              .collection(currentUser)
              .document('stepValidationInnovationFramework')
              .updateData({'bcStepsContent1': true});
        break;

      case 2:
        if (stepBool == false) {
          if (firebaseStep2 != true)
            _firestore
                .collection(currentUser)
                .document('stepValidationInnovationFramework')
                .updateData({'bcStepsContent2': stepBool});
        } else if (stepBool == true)
          _firestore
              .collection(currentUser)
              .document('stepValidationInnovationFramework')
              .updateData({'bcStepsContent2': true});
        break;

      case 3:
        if (stepBool == false) {
          if (firebaseStep3 != true)
            _firestore
                .collection(currentUser)
                .document('stepValidationInnovationFramework')
                .updateData({'bcStepsContent3': stepBool});
        } else if (stepBool == true)
          _firestore
              .collection(currentUser)
              .document('stepValidationInnovationFramework')
              .updateData({'bcStepsContent3': true});

        break;

      case 4:
        if (stepBool == false) {
          if (firebaseStep4 != true)
            _firestore
                .collection(currentUser)
                .document('stepValidationInnovationFramework')
                .updateData({'bcStepsContent4': stepBool});
        } else if (stepBool == true)
          _firestore
              .collection(currentUser)
              .document('stepValidationInnovationFramework')
              .updateData({'bcStepsContent4': true});

        break;

      case 5:
        if (stepBool == false) {
          if (firebaseStep5 != true)
            _firestore
                .collection(currentUser)
                .document('stepValidationInnovationFramework')
                .updateData({'bcStepsContent5': stepBool});
        } else if (stepBool == true)
          _firestore
              .collection(currentUser)
              .document('stepValidationInnovationFramework')
              .updateData({'bcStepsContent5': true});
        break;

      case 6:
        if (stepBool == false) {
          if (firebaseStep6 != true)
            _firestore
                .collection(currentUser)
                .document('stepValidationInnovationFramework')
                .updateData({'bcStepsContent6': stepBool});
        } else if (stepBool == true)
          _firestore
              .collection(currentUser)
              .document('stepValidationInnovationFramework')
              .updateData({'bcStepsContent6': true});
        break;

      case 7:
        if (stepBool == false) {
          if (firebaseStep7 != true)
            _firestore
                .collection(currentUser)
                .document('stepValidationInnovationFramework')
                .updateData({'bcStepsContent7': stepBool});
        } else if (stepBool == true)
          _firestore
              .collection(currentUser)
              .document('stepValidationInnovationFramework')
              .updateData({'bcStepsContent7': true});
        break;

      default:
        print('Number Not Found');
    }
  }

  _GenericStepButtonBIFState(
      this.routeName, this.stepBool, this.step, this.buttonName);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        buttonName,
        //'GO NEXT',
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFFE95420)),
      ),
      onTap: () {
        if (widget.routeName != null) {
          Navigator.pushNamed(context, routeName);
        }
        switchStep();
        if (widget.widget != null) {
          widget.widget();
        }
      },
    );
  }
}
