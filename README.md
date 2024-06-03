# re_exam

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
<p>
  <img src="https://github.com/userravina/re_exam/assets/120082785/81bc1725-fa25-4a71-8bd8-834980bb89b4" height="50%" width="30%">
  <img src="https://github.com/userravina/re_exam/assets/120082785/3938dad3-351a-4d43-99ee-a07457df9043"  height="50%" width="30%">
  <img src="https://github.com/userravina/re_exam/assets/120082785/5c989356-429c-42cb-af53-b846c047d09f" height="50%" width="30%">
  <img src="https://github.com/userravina/re_exam/assets/120082785/f047ff5f-f02b-4762-9b23-c0c8345ea5d2"  height="50%" width="30%">
</p>


name: gst_calculator
description: "A new Flutter project."
# The following line prevents the package from being accidentally published to
# pub.dev using `flutter pub publish`. This is preferred for private packages.
publish_to: 'none' # Remove this line if you wish to publish to pub.dev

# The following defines the version and build number for your application.
# A version number is three numbers separated by dots, like 1.2.43
# followed by an optional build number separated by a +.
# Both the version and the builder number may be overridden in flutter
# build by specifying --build-name and --build-number, respectively.
# In Android, build-name is used as versionName while build-number used as versionCode.
# Read more about Android versioning at https://developer.android.com/studio/publish/versioning
# In iOS, build-name is used as CFBundleShortVersionString while build-number is used as CFBundleVersion.
# Read more about iOS versioning at
# https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
# In Windows, build-name is used as the major, minor, and patch parts
# of the product and file versions while build-number is used as the build suffix.
version: 1.0.0+1

environment:
  sdk: '>=3.3.0 <4.0.0'

# Dependencies specify other packages that your package needs in order to work.
# To automatically upgrade your package dependencies to the latest versions
# consider running `flutter pub upgrade --major-versions`. Alternatively,
# dependencies can be manually updated by changing the version numbers below to
# the latest version available on pub.dev. To see which dependencies have newer
# versions available, run `flutter pub outdated`.
dependencies:
  json_annotation: ^4.9.0
  built_value: ^8.9.2
  flutter:
    sdk: flutter
  device_info_plus: ^10.0.1
  flutter_localizations:
    sdk: flutter
  connectivity_plus: ^6.0.3



  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.6
  get: ^4.6.6
  sizer: ^2.0.15
  language_picker: ^0.4.3
  intl: any
  shared_preferences: ^2.0.13
  flutter_seekbar: ^1.0.1
  soundpool: ^2.4.1
  just_audio: ^0.9.37
  vibration: ^1.8.4
  toggle_switch: ^2.3.0
  pie_chart: ^5.4.0
  http: ^1.2.1
  units_converter: ^3.0.0
  url_launcher: ^6.2.5
  share_plus: ^8.0.3
  google_mobile_ads: ^5.0.0
  purchases_ui_flutter: ^6.28.0
  purchases_flutter: ^6.28.0
  firebase_core: any
  firebase_remote_config: ^4.3.8
  firebase_analytics: ^10.8.0
  path_provider: ^2.1.2
  floor: ^1.4.2
  flutter_slidable: ^3.0.1
  easy_audience_network: ^0.0.6
  flutter_custom_tabs: ^2.0.0+1
  applovin_max: ^3.7.0


dev_dependencies:
  build_runner: ^2.4.9
  json_serializable: ^6.8.0
  built_value_generator: ^8.9.2
  floor_generator: ^1.4.2
  source_gen: ^1.5.0
  analyzer: ^5.0.0
  flutter_test:
    sdk: flutter

  # The "flutter_lints" package below contains a set of recommended lints to
  # encourage good coding practices. The lint set provided by the package is
  # activated in the `analysis_options.yaml` file located at the root of your
  # package. See that file for information about deactivating specific lint
  # rules and activating additional ones.
  flutter_lints: ^3.0.0

# For information on the generic Dart part of this file, see the
# following page: https://dart.dev/tools/pub/pubspec

# The following section is specific to Flutter packages.
flutter:

  generate: true
  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true


  # To add assets to your application, add an assets section, like this:
  # assets:
  #   - images/a_dot_burr.jpeg
  #   - images/a_dot_ham.jpeg
  assets:
    - assets/images/
    - assets/images/more_tools.png
    - assets/images/tools/
    - assets/images/layout/
    - assets/images/layout/theme2/
    - assets/images/layout/theme3/
    - assets/images/layout/theme4/
    - assets/images/layout/theme5/
    - assets/images/layout/theme6/
    - assets/images/layout/theme7/
    - assets/images/layout/theme8/
    - assets/images/layout/theme9/
    - assets/images/layout/theme10/
    - assets/sounds/coin_add.wav
    - assets/sounds/clickeffect.mp3

  # An image asset can refer to one or more resolution-specific "variants", see
  # https://flutter.dev/assets-and-images/#resolution-aware

  # For details regarding adding assets from package dependencies, see
  # https://flutter.dev/assets-and-images/#from-packages

  # To add custom fonts to your application, add a fonts section here,
  # in this "flutter" section. Each entry in this list should have a
  # "family" key with the font family name, and a "fonts" key with a
  # list giving the asset and other descriptors for the font. For
  # example:
  fonts:
    - family: Sansation
      fonts:
        - asset: assets/fonts/Sansation_Regular.ttf

    - family: DS-DIGI
      fonts:
        - asset: assets/fonts/DS-DIGI.TTF

    - family: DS-DIGIB
      fonts:
        - asset: assets/fonts/DS-DIGIB.TTF

  #
  # For details regarding fonts from package dependencies,
  # see https://flutter.dev/custom-fonts/#from-packages

