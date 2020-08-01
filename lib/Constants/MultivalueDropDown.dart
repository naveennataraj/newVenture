import 'package:flutter/material.dart';

class DropDownItem {
  int value;
  String name;

  DropDownItem(this.value, this.name);
}

//
//List <MultiSelectDialogItem<int>> multiItem = List();
//
//final valuestopopulate = {
//  1 : "Value Proposition",
//  2 : "Consumer Segment",
//  3 : "Revenue stream",
//  4 : "Distribution channel",
//  5 : "Customer relationship",
//  6 : "Key activity",
//  7 : "Key partner",
//  8 : "Cost structure",
//  9 : "Value Proposition",
//};

List<DropDownItem> BMCElements = [
  DropDownItem(1, 'Value proposition'),
  DropDownItem(2, 'Customer segment'),
  DropDownItem(3, 'Revenue stream'),
  DropDownItem(4, 'Distribution channel'),
  DropDownItem(5, 'Customer relationship'),
  DropDownItem(6, 'Key activity'),
  DropDownItem(7, 'Key resource'),
  DropDownItem(8, 'Key partner'),
  DropDownItem(9, 'Cost Structure'),
];

List<DropdownMenuItem<DropDownItem>> bmcElementDropDown;

DropDownItem SelectedBcmElement;


List<DropdownMenuItem<DropDownItem>> buildDropDownMenuItems(
    List DropDownItems) {
  List<DropdownMenuItem<DropDownItem>> items = List();
  for (DropDownItem listItem in DropDownItems) {
    items.add(
      DropdownMenuItem(
          child: Row(
            children: <Widget>[
              Checkbox(
                onChanged: (bool value) {

                }, value: true,
              ),
              Text(listItem.name)
            ],
          )
//        child: Text(listItem.name),
//        value: listItem,
      ),
    );
  }
  return items;
}

//
//void populateMultiselect(){
//  for(int v in valuestopopulate.keys){
//    multiItem.add(MultiSelectDialogItem(v,valuestopopulate[v]));
//  }
//}

//List<MultiValueDropDown<int>> potentialSynergies = [
//  MultiValueDropDown(1, 'Value Proposition'),
//  MultiValueDropDown(2, ''),
//  MultiValueDropDown(3, ''),
//  MultiValueDropDown(4, ''),
//  MultiValueDropDown(5, ''),
//  MultiValueDropDown(2, ''),
//  MultiValueDropDown(3, ''),
//  MultiValueDropDown(4, '')
//];

//List<DropdownMenuItem<MultiValueDropDown>> multiplePotentialSynergies;
//
//MultiValueDropDown selectedPotentialSynergies;
//
//List<DropdownMenuItem<MultiValueDropDown>> buildMultiValueDropDownMenuItems(
//    List multiValueDropDowns) {
//  List<DropdownMenuItem<MultiValueDropDown>> items = List();
//  for (MultiValueDropDown listItem in multiValueDropDowns) {
//    items.add(
//      DropdownMenuItem(
//        child: Text(listItem.name),
//        value: listItem,
//      ),
//    );
//  }
//  return items;
//}

//===========================================================


//
//
//class MultiSelectDialog<V> extends StatefulWidget {
//  MultiSelectDialog({Key key, this.items, this.initialSelectedValues}) : super(key: key);
//
//  final List<MultiSelectDialogItem<V>> items;
//  final Set<V> initialSelectedValues;
//
//  @override
//  State<StatefulWidget> createState() => _MultiSelectDialogState<V>();
//}
//
//class _MultiSelectDialogState<V> extends State<MultiSelectDialog<V>> {
//  final _selectedValues = Set<V>();
//
//  void initState() {
//    super.initState();
//    if (widget.initialSelectedValues != null) {
//      _selectedValues.addAll(widget.initialSelectedValues);
//    }
//  }
//
//  void _onItemCheckedChange(V itemValue, bool checked) {
//    setState(() {
//      if (checked) {
//        _selectedValues.add(itemValue);
//      } else {
//        _selectedValues.remove(itemValue);
//      }
//    });
//  }
//
//  void _onCancelTap() {
//    Navigator.pop(context);
//  }
//
//  void _onSubmitTap() {
//    Navigator.pop(context, _selectedValues);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return AlertDialog(
//      title: Text('Select animals'),
//      contentPadding: EdgeInsets.only(top: 12.0),
//      content: SingleChildScrollView(
//        child: ListTileTheme(
//          contentPadding: EdgeInsets.fromLTRB(14.0, 0.0, 24.0, 0.0),
//          child: ListBody(
//            children: widget.items.map(_buildItem).toList(),
//          ),
//        ),
//      ),
//      actions: <Widget>[
//        FlatButton(
//          child: Text('CANCEL'),
//          onPressed: _onCancelTap,
//        ),
//        FlatButton(
//          child: Text('OK'),
//          onPressed: _onSubmitTap,
//        )
//      ],
//    );
//  }
//
//  Widget _buildItem(MultiSelectDialogItem<V> item) {
//    final checked = _selectedValues.contains(item.value);
//    return CheckboxListTile(
//      value: checked,
//      title: Text(item.label),
//      controlAffinity: ListTileControlAffinity.leading,
//      onChanged: (checked) => _onItemCheckedChange(item.value, checked),
//    );
//  }
//}
//
//void _showMultiSelect(BuildContext context) async {
//  populateMultiselect();
//  final items = multiItem;
////  final items = <MultiSelectDialogItem<int>>[
////    MultiSelectDialogItem(1, 'Dog'),
////    MultiSelectDialogItem(2, 'Cat'),
////    MultiSelectDialogItem(3, 'Mouse'),
//  //];
//
//  final selectedValues = await showDialog<Set<int>>(
//    context: context,
//    builder: (BuildContext context) {
//      return MultiSelectDialog(
//        items: items,
//        initialSelectedValues: [1, 3].toSet(),
//      );
//    },
//  );
//
//  print(selectedValues);
//}