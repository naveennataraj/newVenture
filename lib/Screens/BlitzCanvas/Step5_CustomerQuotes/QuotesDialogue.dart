import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step5_CustomerQuotes/BcAddQuote.dart';
import 'package:iventure001/Widgets/AddQuoteButton.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step5_CustomerQuotes/CustomerQuotes.dart';

class BcQuoteDialogue extends StatefulWidget {
  final int index;
  const BcQuoteDialogue({this.index});
  @override
  _BcQuoteDialogueState createState() => _BcQuoteDialogueState(index);
}

var quoteContentLabelColor = Color(0XFF919191);
bool validQuoteContent = true;
var quoteContentTextController = TextEditingController();
final quoteContentFocusNode = new FocusNode();
String quoteContent;

const userUid = "tester@gmail.com";

class _BcQuoteDialogueState extends State<BcQuoteDialogue> {
  final _firestore = Firestore.instance;
  int index;
  bool quoteChecked = false;
  Color checkTextActive = Colors.black;
  Color checkTextInActive = Color(0XFFABABAB);

  _BcQuoteDialogueState(this.index);

  void initState() {
    super.initState();
    if (index != null) {
      quoteContentTextController =
          TextEditingController(text: addingNewQuote[index].content);
      quoteChecked = addingNewQuote[index].checkQuote;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)), //this right here
        child: Container(
          height: MediaQuery.of(context).size.height * 0.40,
          width: MediaQuery.of(context).size.width * 0.4,
          child: Center(
            child: SingleChildScrollView(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Add a quote or excerpt of a conversation:",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TextFieldWidget(
                      labelText: "Add the content here:",
                      maxLines: 2,
                      validText: validQuoteContent,
                      myFocusNode: quoteContentFocusNode,
                      myTextController: quoteContentTextController,
                      textCollecter: quoteContent,
                      helperText: '',
                      labelcolour: quoteContentLabelColor,
                    ),
                    CheckboxListTile(
                      title: Text(
                        'One or more metric(s) can be added based on this quote',
                        style: TextStyle(
                            color: quoteChecked
                                ? checkTextActive
                                : checkTextInActive),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: quoteChecked,
                      onChanged: (bool value) {
                        setState(() {
                          quoteChecked = value;
                        });
                      },
                      activeColor: Color(0XFFE95420),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AddQuoteButton(
                            onTap: () {
                              setState(() {
                                final newQuote = BcAddQuote(
                                    content: quoteContentTextController.text,
                                    checkQuote: quoteChecked);

                                if (index == null) {
                                  addingNewQuote.add(newQuote);
                                  _firestore.collection(userUid+'/Bc5_userFeedback/addQuotes').add({
                                    'content': quoteContentTextController.text,
                                    'checkQuote': quoteChecked,
                                    'Sender': "tester@gmail.com",
                                  });

                                } else {
//                                  addingNewQuote.removeAt(index);
//                                  addingNewQuote.insert(index, newQuote);
                                  _firestore
                                      .collection(userUid+'/Bc5_userFeedback/addQuotes')
                                      .document(addingNewQuote[index].ID)
                                      .updateData({
                                    'content': quoteContentTextController.text,
                                    'checkQuote': quoteChecked,
                                    'Sender': "tester@gmail.com",
                                  });
                                }

                                quoteContentTextController.clear();
                                quoteChecked = false;

                                Navigator.pop(context);
//                                Navigator.push(context, new MaterialPageRoute(builder: (context) => BcStep5CustomerQuotes()),
//                                )
//                                    .then((value) => setState(() {}),);
                              });
                            },
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          CancelButtton(
                            OnTap: () {
                              quoteContentTextController.clear();
                              quoteChecked = false;

                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ),);
  }
}
