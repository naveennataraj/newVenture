import 'package:iventure001/Constants/DropDown.dart';

class ContentBcMetrics {
  final String Name;
  final String Description;
  final DropDownItem SelectedOption;

  ContentBcMetrics({this.SelectedOption, this.Name, this.Description});
}

List<ContentBcMetrics> AddingNewMetrics = [
  ContentBcMetrics(
      Name: 'Problem Space', Description: '', SelectedOption: MetricsList[0]),
  ContentBcMetrics(
      Name: 'Solution Space', Description: '', SelectedOption: MetricsList[1]),
  ContentBcMetrics(
      Name: 'Evangelism', Description: '', SelectedOption: MetricsList[2]),
  ContentBcMetrics(Name: 'Scale', Description: '', SelectedOption: MetricsList[3]),
  ContentBcMetrics(
      Name: 'Evolution', Description: '', SelectedOption: MetricsList[4]),
  ContentBcMetrics(
      Name: 'Ecosystem', Description: '', SelectedOption: MetricsList[5]),
];
