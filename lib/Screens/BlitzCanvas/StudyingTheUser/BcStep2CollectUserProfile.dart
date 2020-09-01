import 'package:flutter/cupertino.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';
import 'package:iventure001/Widgets/HeadBackMenu.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcFrameworkData.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:dots_indicator/dots_indicator.dart';




class BcStep2CollectUserProfile extends StatefulWidget {
  @override
  _BcStep2CollectUserProfileState createState() =>
      _BcStep2CollectUserProfileState();
}

String ID;
bool spinner = false;

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
  Bread(label: "User Profile", route: '/BCStep2UserProfile'),
];

class _BcStep2CollectUserProfileState extends State<BcStep2CollectUserProfile> {
  final _firestore = Firestore.instance.collection(currentUser).document('Bc2_studyingTheUser');
  String userProfileData;

  var userProfileLabelColor = Color(0XFF919191);
  bool validUserProfile = true;
  final userProfileTextController = TextEditingController();
  final userProfileFocusNode = new FocusNode();
  String userProfileText;


  validator() {
    setState(() {
      userProfileTextController.text.isEmpty
          ? validUserProfile = false
          : validUserProfile = true;
    });
  }


  void initState() {
    super.initState();
    (userProfileData == null)? getDocuments() : print ('data exists') ;
  }

  void getDocuments() async {
    final document = await _firestore.get();

    if (document.exists) {
      try {
        setState(() {
          userProfileText = document.data['userProfile'];
          userProfileData=document.data['userProfile'];
          ID = document.documentID;
          userProfileTextController.text = userProfileText;
        });
      } catch (e) {
        print('Bc2_studyingTheUser error of init state $e');
      }
    } else{
      _firestore.collection(currentUser).document('Bc2_studyingTheUser').setData(
          {}
      );
    }

    setState(() {
      spinner = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFAFAFA),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: NavigationBar(),
      ),
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget> [
              Padding(padding: const EdgeInsets.all(8.0),

                  child: Wrap(children: [Breadcrumb(breads: breads, color: Color(0xFFE95420),),],),),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Container(
                      //height: MediaQuery.of(context).size.height * .40,
                      margin: EdgeInsets.only(top: 8.0),
                      width:600,
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
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                "Let's collect some details on the user's Profile",
                                style: cardTitleTextStyle,
                                //textAlign: TextAlign.center,
                              )),
                          TextFieldWidget(
                            labelText:
                            'Please provide a link to the User\'s (updated) Persona',
                            myTextController: userProfileTextController,
                            myFocusNode: userProfileFocusNode,
                            validText: validUserProfile,
                            maxLines: 1,
                            textCollecter: userProfileText,
                            helperText: '',
                            labelcolour: userProfileLabelColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                headBackButtton(
                                  routeName: '/BCHomeView',
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                GenericStepButton(
                                  buttonName: 'GO NEXT',
                                  //routeName: '/BCStep2CaptureUserStories',
                                  step: 1,
                                  stepBool: false,
                                  widget: () {

                                    (userProfileTextController.text == '')
                                        ?
                                      validator()
                                        :
                                      (userProfileTextController.text != '') ? Navigator.pushNamed(context, '/BCStep2CaptureUserStories'): print('');

                                      if (userProfileData != userProfileTextController.text ) {
                                        _firestore.setData({
                                          'userProfile': userProfileTextController.text,
                                          'Sender': currentUser,
                                        });
                                      }
                                      userProfileData = userProfileTextController.text;

                                    }


//                          OnTap: () {
//                             if (userProfileData != userProfileTextController.text ) {
//                              _firestore.setData({
//                                'userProfile': userProfileTextController.text,
//                                'Sender': "tester@gmail.com",
//                              });
//                            }
//                             userProfileData = userProfileTextController.text;
//                            //bcStepsContent[1].bcCompletionValidator = false;
////                            Navigator.pushNamed(
////                                context, '/BCStep2CaptureUserStories');
//                          },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],)
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DotsIndicator(
                decorator: DotsDecorator(
                  activeColor: const Color(0xFFE95420),
                ),
                dotsCount: 2,
                position: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }

//  void onTap() {
//    if (userProfileData != userProfileTextController.text ) {
//      _firestore.setData({
//        'userProfile': userProfileTextController.text,
//        'Sender': currentUser,
//      });
//    }
//    userProfileData = userProfileTextController.text;
//  }

}
