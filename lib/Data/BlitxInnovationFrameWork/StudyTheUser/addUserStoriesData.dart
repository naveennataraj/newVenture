class addUserStories {
  final String Asa;
  final String IWantTo;
  final String SoThat;
  final ID;

  addUserStories({this.ID, this.Asa, this.IWantTo, this.SoThat});
}

List<addUserStories> AddingNewUserStory = [];

List<addUserStories> DemoAddingNewUserStory = [
  addUserStories(
      Asa: 'casual user',
      IWantTo: 'add a task in the least amount of steps possible',
      SoThat: 'I can collect all tasks to be managed in a single location'),
  addUserStories(
      Asa: 'casual user',
      IWantTo: 'be able to prioritise my tasks',
      SoThat: 'I can improve my efficiency')
];
