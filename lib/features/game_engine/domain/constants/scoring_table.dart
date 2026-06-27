import 'package:tenbou_mahjong/features/game_engine/domain/models/winning_hand.dart';

class DealerHandScore {
  final int? ronTotal;
  final int tsumoEach;

  const DealerHandScore({this.ronTotal, required this.tsumoEach});
}

class NonDealerHandScore {
  final int? ronTotal;
  final int tsumoFromDealer;
  final int tsumoFromEach;

  const NonDealerHandScore({
    this.ronTotal,
    required this.tsumoFromDealer,
    required this.tsumoFromEach,
  });
}

DealerHandScore dealerScoreFor(WinningHand hand) {
  return switch (hand) {
    WinningHandStandard(:final han, :final fu) => _dealerStandard(han, fu),
    WinningHandYakuman(:final multiplier) => DealerHandScore(
      ronTotal: 48000 * _checkedMultiplier(multiplier),
      tsumoEach: 16000 * multiplier,
    ),
  };
}

NonDealerHandScore nonDealerScoreFor(WinningHand hand) {
  return switch (hand) {
    WinningHandStandard(:final han, :final fu) => _nonDealerStandard(han, fu),
    WinningHandYakuman(:final multiplier) => NonDealerHandScore(
      ronTotal: 32000 * _checkedMultiplier(multiplier),
      tsumoFromDealer: 16000 * multiplier,
      tsumoFromEach: 8000 * multiplier,
    ),
  };
}

DealerHandScore _dealerStandard(int han, int fu) {
  _checkHan(han);
  if (han >= 5) return _dealerLimit(_rankFromHan(han));
  if (_isKiriageMangan(han, fu)) return _dealerLimit(_mangan);

  final each = _dealerTsumo[han]?[fu];
  if (each == null) {
    throw ArgumentError('No score defined for $han han $fu fu (dealer)');
  }
  return DealerHandScore(ronTotal: _dealerRon[han]?[fu], tsumoEach: each);
}

NonDealerHandScore _nonDealerStandard(int han, int fu) {
  _checkHan(han);
  if (han >= 5) return _nonDealerLimit(_rankFromHan(han));
  if (_isKiriageMangan(han, fu)) return _nonDealerLimit(_mangan);

  final payments = _nonDealerTsumo[han]?[fu];
  if (payments == null) {
    throw ArgumentError('No score defined for $han han $fu fu (non-dealer)');
  }
  return NonDealerHandScore(
    ronTotal: _nonDealerRon[han]?[fu],
    tsumoFromEach: payments.$1,
    tsumoFromDealer: payments.$2,
  );
}

void _checkHan(int han) {
  if (han < 1) {
    throw ArgumentError.value(han, 'han', 'han must be >= 1');
  }
}

int _checkedMultiplier(int multiplier) {
  if (multiplier < 1) {
    throw ArgumentError.value(multiplier, 'multiplier', 'must be >= 1');
  }
  return multiplier;
}

bool _isKiriageMangan(int han, int fu) =>
    (han == 4 && fu >= 30) || (han == 3 && fu >= 60);

const int _mangan = 0;
const int _haneman = 1;
const int _baiman = 2;
const int _sanbaiman = 3;
const int _yakumanRank = 4;

int _rankFromHan(int han) {
  if (han == 5) return _mangan;
  if (han <= 7) return _haneman;
  if (han <= 10) return _baiman;
  if (han <= 12) return _sanbaiman;
  return _yakumanRank;
}

DealerHandScore _dealerLimit(int rank) => DealerHandScore(
  ronTotal: _dealerLimitRon[rank],
  tsumoEach: _dealerLimitTsumoEach[rank],
);

NonDealerHandScore _nonDealerLimit(int rank) => NonDealerHandScore(
  ronTotal: _nonDealerLimitRon[rank],
  tsumoFromDealer: _nonDealerLimitTsumoDealer[rank],
  tsumoFromEach: _nonDealerLimitTsumoEach[rank],
);

const _nonDealerLimitRon = [8000, 12000, 16000, 24000, 32000];
const _nonDealerLimitTsumoEach = [2000, 3000, 4000, 6000, 8000];
const _nonDealerLimitTsumoDealer = [4000, 6000, 8000, 12000, 16000];
const _dealerLimitRon = [12000, 18000, 24000, 36000, 48000];
const _dealerLimitTsumoEach = [4000, 6000, 8000, 12000, 16000];

const _nonDealerRon = <int, Map<int, int>>{
  1: {
    30: 1000,
    40: 1300,
    50: 1600,
    60: 2000,
    70: 2300,
    80: 2600,
    90: 2900,
    100: 3200,
    110: 3600,
  },
  2: {
    25: 1600,
    30: 2000,
    40: 2600,
    50: 3200,
    60: 3900,
    70: 4500,
    80: 5200,
    90: 5800,
    100: 6400,
    110: 7100,
  },
  3: {20: 2600, 25: 3200, 30: 3900, 40: 5200, 50: 6400},
  4: {20: 5200, 25: 6400},
};

const _dealerRon = <int, Map<int, int>>{
  1: {
    30: 1500,
    40: 2000,
    50: 2400,
    60: 2900,
    70: 3400,
    80: 3900,
    90: 4400,
    100: 4800,
    110: 5300,
  },
  2: {
    25: 2400,
    30: 2900,
    40: 3900,
    50: 4800,
    60: 5800,
    70: 6800,
    80: 7700,
    90: 8700,
    100: 9600,
    110: 10600,
  },
  3: {20: 3900, 25: 4800, 30: 5800, 40: 7700, 50: 9600},
  4: {20: 7700, 25: 9600},
};

const _nonDealerTsumo = <int, Map<int, (int, int)>>{
  1: {
    30: (300, 500),
    40: (400, 700),
    50: (400, 800),
    60: (500, 1000),
    70: (600, 1200),
    80: (700, 1300),
    90: (800, 1500),
    100: (800, 1600),
    110: (900, 1800),
  },
  2: {
    20: (400, 700),
    30: (500, 1000),
    40: (700, 1300),
    50: (800, 1600),
    60: (1000, 2000),
    70: (1200, 2300),
    80: (1300, 2600),
    90: (1500, 2900),
    100: (1600, 3200),
    110: (1800, 3600),
  },
  3: {
    20: (700, 1300),
    25: (800, 1600),
    30: (1000, 2000),
    40: (1300, 2600),
    50: (1600, 3200),
  },
  4: {20: (1300, 2600), 25: (1600, 3200)},
};

const _dealerTsumo = <int, Map<int, int>>{
  1: {
    30: 500,
    40: 700,
    50: 800,
    60: 1000,
    70: 1200,
    80: 1300,
    90: 1500,
    100: 1600,
    110: 1800,
  },
  2: {
    20: 700,
    30: 1000,
    40: 1300,
    50: 1600,
    60: 2000,
    70: 2300,
    80: 2600,
    90: 2900,
    100: 3200,
    110: 3600,
  },
  3: {20: 1300, 25: 1600, 30: 2000, 40: 2600, 50: 3200},
  4: {20: 2600, 25: 3200},
};
