import 'package:flutter/material.dart';

class DropDownItem {
  int value;
  String name;

  DropDownItem(this.value, this.name);
}

List<DropDownItem> ProblemDomainlist = [
  DropDownItem(1, 'Enterprise'),
  DropDownItem(2, 'Consumer'),
  DropDownItem(3, 'Both Enterprise and Consumer'),
  DropDownItem(4, 'Not Sure')
];

List<DropDownItem> UserEnvironmentList = [
  DropDownItem(1, 'Urban'),
  DropDownItem(2, 'Rural'),
];

List<DropdownMenuItem<DropDownItem>> ProblemDomaindropdown;
List<DropdownMenuItem<DropDownItem>> UserEnvironmentdropdown;
DropDownItem SelectedProblemDomain;
DropDownItem SelectedUserEnvironment;

List<DropdownMenuItem<DropDownItem>> buildDropDownMenuItems(
    List DropDownItems) {
  List<DropdownMenuItem<DropDownItem>> items = List();
  for (DropDownItem listItem in DropDownItems) {
    items.add(
      DropdownMenuItem(
        child: Text(listItem.name),
        value: listItem,
      ),
    );
  }
  return items;
}
