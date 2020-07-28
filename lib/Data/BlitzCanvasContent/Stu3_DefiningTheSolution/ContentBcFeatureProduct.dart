class ContentBcFeatureProduct {
  final String FeatureTitle;
  final String FeatureDescription;
  final bool FeatureChecked;
  final int FeatureType;

  ContentBcFeatureProduct({
    this.FeatureType,
    this.FeatureTitle,
    this.FeatureDescription,
    this.FeatureChecked,
  });
}

List<ContentBcFeatureProduct> addingNewProductFeature = [];