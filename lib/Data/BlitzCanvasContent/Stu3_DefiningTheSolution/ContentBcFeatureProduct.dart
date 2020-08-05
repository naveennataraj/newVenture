class ContentBcFeatureProduct {
  final String FeatureTitle;
  final String FeatureDescription;
  final bool FeatureChecked;
  final int FeatureType;
  final ID;

  ContentBcFeatureProduct({
    this.FeatureType,
    this.FeatureTitle,
    this.FeatureDescription,
    this.FeatureChecked,
    this.ID
  });
}

List<ContentBcFeatureProduct> addingNewProductFeature = [];