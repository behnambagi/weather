
import 'package:weathera_app/core/enums/enums.dart';
import 'package:weathera_app/core/helpers/helpers_app.dart';

class ImageAsset{
  final String suffix;
  final AssetEnum asset;

  const ImageAsset(this.suffix, {required this.asset});
  String get patch => asset.patch+suffix;
}

class Images {
  //clear sky
  static const ImageAsset d01 = ImageAsset("01d", asset: AssetEnum.weatherIcon);
  static const ImageAsset n01 = ImageAsset("01n", asset: AssetEnum.weatherIcon);

}