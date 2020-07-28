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

List<DropDownItem> SolutionRankingList = [];

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

List<DropDownItem> IntellectualAssets = [
  DropDownItem(1, 'Contract'),
  DropDownItem(2, 'Copyright'),
  DropDownItem(3, 'Trademark'),
  DropDownItem(4, 'Tradesecret'),
  DropDownItem(5, 'Patent'),
];

List<DropDownItem> ServiceType = [
  DropDownItem(1, 'Software as a Service'),
  DropDownItem(2, 'Rapid application development framework'),
  DropDownItem(3, 'Third party framework'),
];

List<DropDownItem> ServiceUsage = [
  DropDownItem(1, '5%'),
  DropDownItem(2, '10%'),
  DropDownItem(3, '15%'),
  DropDownItem(4, '20%'),
  DropDownItem(5, '25%'),
  DropDownItem(6, '30%'),
  DropDownItem(7, '35%'),
  DropDownItem(8, '40%'),
  DropDownItem(9, '45%'),
  DropDownItem(10, '50%'),
  DropDownItem(11, '55%'),
  DropDownItem(12, '60%'),
  DropDownItem(13, '65%'),
  DropDownItem(14, '70%'),
  DropDownItem(15, '75%'),
  DropDownItem(16, '80%'),
  DropDownItem(17, '85%'),
  DropDownItem(18, '90%'),
  DropDownItem(19, '95%'),
  DropDownItem(20, '100%'),
];

List<DropdownMenuItem<DropDownItem>> ProblemDomaindropdown;
List<DropdownMenuItem<DropDownItem>> UserEnvironmentdropdown;
List<DropdownMenuItem<DropDownItem>> Solutionsdropdown;
List<DropdownMenuItem<DropDownItem>> bmcElementDropDown;
List<DropdownMenuItem<DropDownItem>> intellectualAssetsDropDown;
List<DropdownMenuItem<DropDownItem>> serviceTypeDropDown;
List<DropdownMenuItem<DropDownItem>> serviceUsageDropDown;

DropDownItem SelectedProblemDomain;
DropDownItem SelectedUserEnvironment;
DropDownItem SelectedFirstSolution;
DropDownItem SelectedSecondSolution;
DropDownItem SelectedThirdSolution;
DropDownItem SelectedBcmElement;
DropDownItem SelectedIntellectualAsset;
DropDownItem SelectedServiceType;
DropDownItem SelectedServiceUsage;

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
