import 'package:iventure001/Constants/DropDown.dart';

class addUserEnvironment {
  final String issues;
  final String detail;
  final double ageRangeStart;
  final double ageRangeEnd;
  final DropDownItem ProblemDrop;
  final DropDownItem EnvironmentDrop;
  final ID;

  addUserEnvironment(
      {this.ID,
      this.issues,
      this.detail,
      this.ageRangeStart,
      this.ageRangeEnd,
      this.EnvironmentDrop,
      this.ProblemDrop});
}

List<addUserEnvironment> UserEnvironmentArray = [];
