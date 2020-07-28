import 'package:iventure001/Constants/DropDown.dart';

class addMetrics {
  final String Name;
  final String Description;
  final DropDownItem SelectedOption;

  addMetrics({this.SelectedOption, this.Name, this.Description});
}

List<addMetrics> AddingNewMetrics = [
  addMetrics(
      Name: 'Problem Space', Description: '', SelectedOption: MetricsList[0]),
  addMetrics(
      Name: 'Solution Space', Description: '', SelectedOption: MetricsList[1]),
  addMetrics(
      Name: 'Evangelism', Description: '', SelectedOption: MetricsList[2]),
  addMetrics(Name: 'Scale', Description: '', SelectedOption: MetricsList[3]),
  addMetrics(
      Name: 'Evolution', Description: '', SelectedOption: MetricsList[4]),
  addMetrics(
      Name: 'Ecosystem', Description: '', SelectedOption: MetricsList[5]),
];
