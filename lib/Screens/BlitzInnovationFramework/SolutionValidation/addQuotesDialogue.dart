import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionValidation/addQuote.dart';
import 'package:iventure001/Widgets/AddQuoteButton.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';

class addQuotesDialogue extends StatefulWidget {
  final int index;

  const addQuotesDialogue({this.index});
  @override
  _addQuotesDialogueState createState() => _addQuotesDialogueState(index);
}

var QuoteContentlabelColor = Color(0XFF919191);
bool validQuoteContent = true;
var QuoteContentTextController = TextEditingController();
final QuoteContentFocusNode = new FocusNode();
String QuoteContent;

class _addQuotesDialogueState extends State<addQuotesDialogue> {
  int index;
  bool Quotechecked = false;
  Color CheckTextActive = Colors.black;
  Color CheckTextInActive = Color(0XFFABABAB);

  _addQuotesDialogueState(this.index);
  @override
  void initState() {
    super.initState();
    if (index != null) {
      QuoteContentTextController =
          TextEditingController(text: AddingNewQuote[index].Content);
      Quotechecked = AddingNewQuote[index].CheckQuote;
    }
  }

  final _firestore = Firestore.instance;
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
                      myFocusNode: QuoteContentFocusNode,
                      myTextController: QuoteContentTextController,
                      textCollecter: QuoteContent,
                      helperText: '',
                      labelcolour: QuoteContentlabelColor,
                    ),
                    CheckboxListTile(
                      title: Text(
                        'One or more metric(s) can be added based on this quote',
                        style: TextStyle(
                            color: Quotechecked
                                ? CheckTextActive
                                : CheckTextInActive),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: Quotechecked,
                      onChanged: (bool value) {
                        setState(() {
                          Quotechecked = value;
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
//                                final NewQuote = addQuote(
//                                    Content: QuoteContentTextController.text,
//                                    CheckQuote: Quotechecked);

                                if (index == null) {
//                                  AddingNewQuote.add(NewQuote);
                                  _firestore
                                      .collection(
                                          '$currentUser/SolutionValidation/Quote')
                                      .add({
                                    'Content': QuoteContentTextController.text,
                                    'CheckQuote': Quotechecked,
                                    'Sender': currentUser,
                                  });
                                } else {
//                                  AddingNewQuote.removeAt(index);
//                                  AddingNewQuote.insert(index, NewQuote);
                                  _firestore
                                      .collection(
                                          '$currentUser/SolutionValidation/Quote')
                                      .document(AddingNewQuote[index].ID)
                                      .updateData({
                                    'Content': QuoteContentTextController.text,
                                    'CheckQuote': Quotechecked,
                                    'Sender': currentUser,
                                  });
                                }

                                QuoteContentTextController.clear();
                                Quotechecked = false;

                                Navigator.pop(context);
                              });
                            },
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          CancelButtton(
                            OnTap: () {
                              QuoteContentTextController.clear();
                              Quotechecked = false;

                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }
}
