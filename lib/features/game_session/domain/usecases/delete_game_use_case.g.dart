// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_game_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(deleteGameUseCase)
final deleteGameUseCaseProvider = DeleteGameUseCaseProvider._();

final class DeleteGameUseCaseProvider
    extends
        $FunctionalProvider<
          DeleteGameUseCase,
          DeleteGameUseCase,
          DeleteGameUseCase
        >
    with $Provider<DeleteGameUseCase> {
  DeleteGameUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteGameUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteGameUseCaseHash();

  @$internal
  @override
  $ProviderElement<DeleteGameUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeleteGameUseCase create(Ref ref) {
    return deleteGameUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteGameUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteGameUseCase>(value),
    );
  }
}

String _$deleteGameUseCaseHash() => r'1db76cdb5d6d0daf26b2769d6fe796a1b6996d94';
