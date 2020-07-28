import 'package:flutter/material.dart';

const cardColor = Color(0xFFF7C3B1);

class SmallOrangeCardWithTitle extends StatefulWidget {
  final String title;
  final String description;
  final int index;
  final List removingat;
  Widget Dialogue;

  SmallOrangeCardWithTitle(
      {this.description,
      this.index,
      this.removingat,
      this.Dialogue,
      this.title});

  @override
  _SmallOrangeCardWithTitleState createState() =>
      _SmallOrangeCardWithTitleState();
}

class _SmallOrangeCardWithTitleState extends State<SmallOrangeCardWithTitle> {
  bool erased;

  @override
  void initState() {
    erased = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return erased
        ? Container()
        : GestureDetector(
            onTap: () {},
            child: Container(
              height: 180,
              width: 370,
              margin: EdgeInsets.symmetric(horizontal: 46.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: cardColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 10.0)),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //SizedBox(height: 30.0),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      widget.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                      height: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  widget.Dialogue,
                            ).then((_) => setState(() {}));
                          },
                          child: Icon(Icons.edit),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              erased = true;
                              widget.removingat.removeAt(widget.index);
                            });
                          },
                          child: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
