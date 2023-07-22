class Assets {
  static ImageAsset images = ImageAsset();
  static RiveAsset rives = RiveAsset();
}

class ImageAsset {
  ImageAsset();
  var path = 'assets/images/';
}

class RiveAsset {
  RiveAsset();
  String path = 'assets/rives/';

  String get piggy => '${path}piggy.riv';
}
