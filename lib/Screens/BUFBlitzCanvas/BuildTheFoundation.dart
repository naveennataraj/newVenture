import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step1/BcStep1CollectDetailsBusiness.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';


class BIF extends BcStep1CollectionAspects {

  @override
  Widget build(BuildContext context) {
    GenericStepButton(

        buttonName: 'GO NAVEEN',
        //pageValidation: (missionTextController.text == '') ? true : false,
        step: 0,
        stepBool: false,

    );
  }
}
