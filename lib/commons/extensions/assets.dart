

extension ImagesExtension on String {
  String get assetImagePath => 'assets/images/$this';
  String get assetImagesPathPNG => 'assets/images/$this.png';
  String get assetImagesPathSVG => 'assets/images/$this.svg';
  String get assetIconsPathPNG => 'assets/icons/$this.png';
  String get assetIconsPath => 'assets/icons/$this';
  String get assetIconsPathSVG => 'assets/icons/$this.svg';
}
