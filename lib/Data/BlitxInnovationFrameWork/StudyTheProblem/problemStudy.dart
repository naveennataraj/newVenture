class problemStudy {
  final String title;
  final String problem;
  final String importance;
  final ID;
  problemStudy({this.title, this.problem, this.importance, this.ID});
}

List<problemStudy> ProblemStudyArray = [];

List<problemStudy> DemoProblemStudyArray = [
  problemStudy(
      title: 'My ToDo list',
      problem:
          'The customer tends to have too many tasks to manage. There is no system in place to help them manage their tasks efficiently, at the moment.',
      importance:
          'If the customers cannot reach a certain level of productivity, they will be unable to meet their target goals for the quater and therefore will be more likely to create poor quality products (or lose their paying clients).',
      ID: 'ProblemStudyID001')
];
