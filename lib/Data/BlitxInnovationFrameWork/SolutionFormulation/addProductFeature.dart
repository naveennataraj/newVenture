class addProductFeature {
  final String FeatureTitle;
  final String FeatureDescription;
  final bool FeatureChecked;
  final int FeatureType;
  final ID;

  addProductFeature({
    this.ID,
    this.FeatureType,
    this.FeatureTitle,
    this.FeatureDescription,
    this.FeatureChecked,
  });
}

List<addProductFeature> AddingNewProductFeature = [];
