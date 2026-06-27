// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'end_round_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(endRoundUseCase)
final endRoundUseCaseProvider = EndRoundUseCaseProvider._();

final class EndRoundUseCaseProvider
    extends
        $FunctionalProvider<EndRoundUseCase, EndRoundUseCase, EndRoundUseCase>
    with $Provider<EndRoundUseCase> {
  EndRoundUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'endRoundUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$endRoundUseCaseHash();

  @$internal
  @override
  $ProviderElement<EndRoundUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  EndRoundUseCase create(Ref ref) {
    return endRoundUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EndRoundUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EndRoundUseCase>(value),
    );
  }
}

String _$endRoundUseCaseHash() => r'114b75bb465c8023fc15d412bdaa171c1e755a52';
