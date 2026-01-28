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
    3004876405,
    2155815891,
    239807252,
    1043253431,
    35018145,
    2825207354,
    2256818170,
    740919023,
    2032147161,
    2093463706,
    3775880894,
    851576469,
    819244488,
    3909689709,
    3054068000,
    2096674076,
    4176185832,
    2547148615,
    2600670893,
    1456427947,
    1368908215,
  ];

  static const List<int> _envieddataapiBaseUrl = <int>[
    3004876317,
    2155815847,
    239807328,
    1043253447,
    35018194,
    2825207296,
    2256818133,
    740918976,
    2032147115,
    2093463803,
    3775880912,
    851576561,
    819244455,
    3909689600,
    3054068053,
    2096674159,
    4176185741,
    2547148597,
    2600670851,
    1456427974,
    1368908242,
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
    3056707479,
    1663246151,
    1097005945,
    3867584599,
    2283753628,
    1746390907,
    1122234972,
    337909630,
    1772217620,
    1982285245,
    4194217634,
    1152911387,
    2440297383,
    1792560628,
    422480540,
    4171666400,
    848920,
    3266290766,
    60844203,
    1983276379,
    3211949965,
  ];

  static const List<int> _envieddataapiBaseUrl = <int>[
    3056707583,
    1663246131,
    1097005837,
    3867584551,
    2283753711,
    1746390849,
    1122234995,
    337909585,
    1772217702,
    1982285276,
    4194217676,
    1152911487,
    2440297416,
    1792560537,
    422480617,
    4171666323,
    849021,
    3266290748,
    60844165,
    1983276342,
    3211950056,
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
