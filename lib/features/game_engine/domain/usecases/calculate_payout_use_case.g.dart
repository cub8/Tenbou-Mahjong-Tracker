// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculate_payout_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(calculatePayoutUseCase)
final calculatePayoutUseCaseProvider = CalculatePayoutUseCaseProvider._();

final class CalculatePayoutUseCaseProvider
    extends
        $FunctionalProvider<
          CalculatePayoutUseCase,
          CalculatePayoutUseCase,
          CalculatePayoutUseCase
        >
    with $Provider<CalculatePayoutUseCase> {
  CalculatePayoutUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'calculatePayoutUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$calculatePayoutUseCaseHash();

  @$internal
  @override
  $ProviderElement<CalculatePayoutUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CalculatePayoutUseCase create(Ref ref) {
    return calculatePayoutUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CalculatePayoutUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CalculatePayoutUseCase>(value),
    );
  }
}

String _$calculatePayoutUseCaseHash() =>
    r'209bfcf0cb7d6e29094a545186dca3cbceb154de';
