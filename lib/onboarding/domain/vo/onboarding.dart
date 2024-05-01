import '../../../gen/assets.gen.dart';
import '../../../l10n/generated/l10n.dart';

class OnboardingVo {
  OnboardingVo({this.image, this.title, this.desc});

  final String? image;
  final String? title;
  final String? desc;
}

class OnboardingData {
  static final List<OnboardingVo> items = [
    OnboardingVo(
      image: Assets.svg.onboard1,
      title: S.current.personalizeYourPref,
      desc: S.current.customizeYourIDeal,
    ),
    OnboardingVo(
      image: Assets.svg.onboard2,
      title: S.current.discoverTailoredMathes,
      desc: S.current.browseProfiles,
    ),
    OnboardingVo(
      image: Assets.svg.onboard3,
      title: S.current.connectAndAdopt,
      desc: S.current.messageShelters,
    ),
  ];
}
