import 'package:flutter_test/flutter_test.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/constants/scoring_table.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/winning_hand.dart';

void main() {
  group('scoreFor - sub-mangan', () {
    test('non-dealer 1 han 30 fu', () {
      final score = nonDealerScoreFor(
        const WinningHand.standard(han: 1, fu: 30),
      );
      expect(score.ronTotal, 1000);
      expect(score.tsumoFromEach, 300);
      expect(score.tsumoFromDealer, 500);
    });

    test('dealer 2 han 30 fu tsumo is the same for all opponents', () {
      final score = dealerScoreFor(const WinningHand.standard(han: 2, fu: 30));
      expect(score.ronTotal, 2900);
      expect(score.tsumoEach, 1000);
    });
  });

  group('scoreFor - Kiriage Mangan', () {
    test('non-dealer 4 han 30 fu rounds up to Mangan ron', () {
      final score = nonDealerScoreFor(
        const WinningHand.standard(han: 4, fu: 30),
      );
      expect(score.ronTotal, 8000);
    });

    test('non-dealer 3 han 60 fu rounds up to Mangan', () {
      final score = nonDealerScoreFor(
        const WinningHand.standard(han: 3, fu: 60),
      );
      expect(score.ronTotal, 8000);
      expect(score.tsumoFromEach, 2000);
      expect(score.tsumoFromDealer, 4000);
    });

    test('dealer 4 han 30 fu and 3 han 60 fu round up to Mangan', () {
      expect(
        dealerScoreFor(const WinningHand.standard(han: 4, fu: 30)).ronTotal,
        12000,
      );
      expect(
        dealerScoreFor(const WinningHand.standard(han: 3, fu: 60)).ronTotal,
        12000,
      );
    });

    test('values just below the Kiriage cells are unchanged', () {
      expect(
        nonDealerScoreFor(const WinningHand.standard(han: 4, fu: 25)).ronTotal,
        6400,
      );
      expect(
        nonDealerScoreFor(const WinningHand.standard(han: 3, fu: 50)).ronTotal,
        6400,
      );
    });
  });

  group('scoreFor - limit hands by han', () {
    test('non-dealer mangan/haneman/baiman/sanbaiman/yakuman ron', () {
      int ron(int han) =>
          nonDealerScoreFor(WinningHand.standard(han: han, fu: 30)).ronTotal!;
      expect(ron(5), 8000);
      expect(ron(6), 12000);
      expect(ron(7), 12000);
      expect(ron(8), 16000);
      expect(ron(9), 16000);
      expect(ron(10), 16000);
      expect(ron(11), 24000);
      expect(ron(12), 24000);
      expect(ron(13), 32000);
    });

    test('dealer mangan/haneman/baiman/sanbaiman/yakuman ron', () {
      int ron(int han) =>
          dealerScoreFor(WinningHand.standard(han: han, fu: 30)).ronTotal!;
      expect(ron(5), 12000);
      expect(ron(6), 18000);
      expect(ron(7), 18000);
      expect(ron(8), 24000);
      expect(ron(9), 24000);
      expect(ron(10), 24000);
      expect(ron(11), 36000);
      expect(ron(12), 36000);
      expect(ron(13), 48000);
    });

    test('mangan tsumo payments', () {
      final nonDealer = nonDealerScoreFor(
        const WinningHand.standard(han: 5, fu: 30),
      );
      expect(nonDealer.tsumoFromEach, 2000);
      expect(nonDealer.tsumoFromDealer, 4000);

      final dealer = dealerScoreFor(const WinningHand.standard(han: 5, fu: 30));
      expect(dealer.tsumoEach, 4000);
    });
  });

  group('scoreFor - yakuman', () {
    test('single yakuman', () {
      expect(
        nonDealerScoreFor(const WinningHand.yakuman(multiplier: 1)).ronTotal,
        32000,
      );
      expect(
        dealerScoreFor(const WinningHand.yakuman(multiplier: 1)).ronTotal,
        48000,
      );
    });

    test('double yakuman scales the single value', () {
      final score = nonDealerScoreFor(const WinningHand.yakuman(multiplier: 2));
      expect(score.ronTotal, 64000);
      expect(score.tsumoFromEach, 16000);
      expect(score.tsumoFromDealer, 32000);
    });
  });

  group('scoreFor - impossible / undefined cells', () {
    test('1 han 20 fu and 1 han 25 fu throw', () {
      expect(
        () => nonDealerScoreFor(const WinningHand.standard(han: 1, fu: 20)),
        throwsArgumentError,
      );
      expect(
        () => nonDealerScoreFor(const WinningHand.standard(han: 1, fu: 25)),
        throwsArgumentError,
      );
    });

    test('2 han 20 fu has a tsumo value but no ron', () {
      final score = nonDealerScoreFor(
        const WinningHand.standard(han: 2, fu: 20),
      );
      expect(score.ronTotal, isNull);
      expect(score.tsumoFromEach, 400);
      expect(score.tsumoFromDealer, 700);
    });
  });
}
