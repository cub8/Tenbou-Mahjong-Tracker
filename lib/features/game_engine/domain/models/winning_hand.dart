import 'package:freezed_annotation/freezed_annotation.dart';
part "winning_hand.freezed.dart";

@freezed
sealed class WinningHand with _$WinningHand {
  const factory WinningHand.standard({required int han, required int fu}) =
      WinningHandStandard;

  const factory WinningHand.yakuman({required int multiplier}) =
      WinningHandYakuman;
}
