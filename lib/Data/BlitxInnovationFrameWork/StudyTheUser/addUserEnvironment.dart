class addUserEnvironment {
  final String issues;
  final String detail;
  final double ageRangeStart;
  final double ageRangeEnd;
  final String ProblemDrop;
  final String EnvironmentDrop;
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

List<addUserEnvironment> DemoUserEnvironmentArray = [
  addUserEnvironment(
      issues: 'During work.',
      detail:
          'The end users tend to work collaboratively on many of the tasks.',
      ageRangeStart: 18,
      ageRangeEnd: 34,
      ProblemDrop: 'Both Enterprise and Consumer',
      EnvironmentDrop: 'Urban')
];
