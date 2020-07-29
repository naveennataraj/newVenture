import 'package:flutter/material.dart';

class MultiValueDropDown {
  int value;
  String name;

  MultiValueDropDown(this.value, this.name);
}

List<MultiValueDropDown> potentialSynergies = [
  MultiValueDropDown(1, 'Value Proposition'),
  MultiValueDropDown(2, 'Consumer Segment'),
  MultiValueDropDown(3, 'Revenue stream'),
  MultiValueDropDown(4, 'Distribution channel'),
  MultiValueDropDown(5, 'Customer relationship'),
  MultiValueDropDown(2, 'Key activity'),
  MultiValueDropDown(3, 'Key partner'),
  MultiValueDropDown(4, 'Cost structure')
];

List<DropdownMenuItem<MultiValueDropDown>> multiplePotentialSynergies;

MultiValueDropDown selectedPotentialSynergies;

List<DropdownMenuItem<MultiValueDropDown>> buildDropDownMenuItems(
    List multiValueDropDowns) {
  List<DropdownMenuItem<MultiValueDropDown>> items = List();
  for (MultiValueDropDown listItem in multiValueDropDowns) {
    items.add(
      DropdownMenuItem(
        child: Text(listItem.name),
        value: listItem,
      ),
    );
  }
  return items;
}
