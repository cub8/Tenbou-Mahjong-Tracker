// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(eventDataSource)
final eventDataSourceProvider = EventDataSourceProvider._();

final class EventDataSourceProvider
    extends
        $FunctionalProvider<EventDataSource, EventDataSource, EventDataSource>
    with $Provider<EventDataSource> {
  EventDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'eventDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$eventDataSourceHash();

  @$internal
  @override
  $ProviderElement<EventDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  EventDataSource create(Ref ref) {
    return eventDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EventDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EventDataSource>(value),
    );
  }
}

String _$eventDataSourceHash() => r'295b7c02a42dffc33ec36b24bfe8c3bc1c996559';
