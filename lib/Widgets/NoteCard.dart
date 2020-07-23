import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final String Note;

  const NoteCard({@required this.Note});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(width: 1, color: Color(0XFFE95420)),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Icon(
              Icons.error,
              color: Color(0XFFE95420),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  Note,
                  style: TextStyle(
                    color: Color(0XFFE95420),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
