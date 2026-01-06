// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// generated_from: .env
final class _ProductionEnv implements Env {
  static const List<int> _enviedkeyapiBaseUrl = <int>[
    4207808473,
    835350847,
    2964784480,
    2891738948,
    498243363,
    281724436,
    1441734652,
    2487055291,
    3626298540,
    264555508,
    1666816454,
    1661904768,
    1465288514,
    2256703678,
    1647224578,
    2485350984,
    1665242342,
    1876740361,
    1127729849,
    4244675900,
    2835030675,
    3025801173,
  ];

  static const List<int> _envieddataapiBaseUrl = <int>[
    4207808433,
    835350859,
    2964784404,
    2891738932,
    498243408,
    281724462,
    1441734611,
    2487055252,
    3626298590,
    264555413,
    1666816424,
    1661904868,
    1465288493,
    2256703699,
    1647224695,
    2485350971,
    1665242243,
    1876740475,
    1127729815,
    4244675921,
    2835030774,
    3025801136,
  ];

  @override
  final String apiBaseUrl = String.fromCharCodes(
    List<int>.generate(
      _envieddataapiBaseUrl.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddataapiBaseUrl[i] ^ _enviedkeyapiBaseUrl[i]),
  );
}

final class _DebugEnv implements Env {
  static const List<int> _enviedkeyapiBaseUrl = <int>[
    746405711,
    4149681078,
    1620703884,
    3244010780,
    1856582835,
    3402313085,
    1267409475,
    3391957225,
    3942934837,
    1945063660,
    942132331,
    3632907242,
    3915486210,
    1564875783,
    3652723307,
    1923754955,
    3455400467,
    1753449768,
    1410507773,
    3694099520,
    2715462741,
  ];

  static const List<int> _envieddataapiBaseUrl = <int>[
    746405671,
    4149681090,
    1620703992,
    3244010860,
    1856582848,
    3402313031,
    1267409516,
    3391957190,
    3942934855,
    1945063565,
    942132229,
    3632907150,
    3915486317,
    1564875882,
    3652723230,
    1923754936,
    3455400566,
    1753449818,
    1410507731,
    3694099501,
    2715462704,
  ];

  @override
  final String apiBaseUrl = String.fromCharCodes(
    List<int>.generate(
      _envieddataapiBaseUrl.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddataapiBaseUrl[i] ^ _enviedkeyapiBaseUrl[i]),
  );
}
