/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/banner.png
  AssetGenImage get banner => const AssetGenImage('assets/images/banner.png');

  /// File path: assets/images/cat_1.jpeg
  AssetGenImage get cat1 => const AssetGenImage('assets/images/cat_1.jpeg');

  /// File path: assets/images/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/images/splash.png');

  /// List of all assets
  List<AssetGenImage> get values => [banner, cat1, splash];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/arrow_back.svg
  String get arrowBack => 'assets/svg/arrow_back.svg';

  /// File path: assets/svg/ic_favorite.svg
  String get icFavorite => 'assets/svg/ic_favorite.svg';

  /// File path: assets/svg/ic_home.svg
  String get icHome => 'assets/svg/ic_home.svg';

  /// File path: assets/svg/ic_paw.svg
  String get icPaw => 'assets/svg/ic_paw.svg';

  /// File path: assets/svg/ic_user.svg
  String get icUser => 'assets/svg/ic_user.svg';

  /// File path: assets/svg/onboard_1.svg
  String get onboard1 => 'assets/svg/onboard_1.svg';

  /// File path: assets/svg/onboard_2.svg
  String get onboard2 => 'assets/svg/onboard_2.svg';

  /// File path: assets/svg/onboard_3.svg
  String get onboard3 => 'assets/svg/onboard_3.svg';

  /// File path: assets/svg/onboard_4.svg
  String get onboard4 => 'assets/svg/onboard_4.svg';

  /// List of all assets
  List<String> get values => [
        arrowBack,
        icFavorite,
        icHome,
        icPaw,
        icUser,
        onboard1,
        onboard2,
        onboard3,
        onboard4
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
