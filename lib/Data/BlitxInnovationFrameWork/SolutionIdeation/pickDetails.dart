class pickDetails {
  final String TopPick;
  final String PVP;
  final String Event;
  final String Traits;
  final String Monetize;
  final bool checked;
  final ID;

  pickDetails(
      {this.checked,
      this.Monetize,
      this.Traits,
      this.Event,
      this.PVP,
      this.TopPick,
      this.ID});
}

List<pickDetails> PickDetailsArray = [];
