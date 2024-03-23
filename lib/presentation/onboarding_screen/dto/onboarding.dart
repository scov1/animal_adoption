import '../../../gen/assets.gen.dart';
import '../../../l10n/generated/l10n.dart';

class OnboardingDto {
  OnboardingDto({this.image, this.title, this.desc});

  final String? image;
  final String? title;
  final String? desc;
}

class OnboardingData {
  static final List<OnboardingDto> items = [
    OnboardingDto(
      image: Assets.svg.onboard1,
      title: S.current.personalizeYourPref,
      desc: S.current.customizeYourIDeal,
    ),
    OnboardingDto(
      image: Assets.svg.onboard2,
      title: S.current.discoverTailoredMathes,
      desc: S.current.browseProfiles,
    ),
    OnboardingDto(
      image: Assets.svg.onboard3,
      title: S.current.connectAndAdopt,
      desc: S.current.messageShelters,
    ),
  ];
}
