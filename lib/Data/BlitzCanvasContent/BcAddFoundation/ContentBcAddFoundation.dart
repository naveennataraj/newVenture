class ContentBcAddFoundation {
  final String generalTitle;
  final String title;
  final String description;
  final String goal;
  final String coreCompetence;
  final String coreCulturalAspect;


  ContentBcAddFoundation({
    this.generalTitle,
    this.title,
    this.description,
    this.goal,
    this.coreCompetence,
    this.coreCulturalAspect,
  });
}

List<ContentBcAddFoundation> foundationContent = [
  ContentBcAddFoundation(
    generalTitle: 'Add details of the foundational aspects of the business',
    title: 'core competence',
    description: "Developing models for prediction based on relevant data",
  ),
  ContentBcAddFoundation(
    title: 'core cultural aspect',
    description: "Attention to detail when crafting user experiences",
  ),

];

List<ContentBcAddFoundation> addPainPointsContent = [
  ContentBcAddFoundation(
    description: '"The user in unable to work on shared assignments or tasks"',
  ),
];
