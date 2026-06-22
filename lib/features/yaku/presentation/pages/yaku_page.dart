import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tenbou_mahjong/features/yaku/data/models/yaku_record.dart';
import 'package:tenbou_mahjong/features/yaku/domain/repositories/yaku_repository.dart';
import 'package:tenbou_mahjong/features/yaku/presentation/widgets/mahjong_tiles_widget.dart';
import 'package:tenbou_mahjong/features/yaku/presentation/widgets/value_icon_widget.dart';

class YakuPage extends ConsumerWidget {
  final String id;

  const YakuPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordAsync = ref.watch(_yakuRecordProvider(id));

    return Scaffold(
      appBar: AppBar(),
      body: recordAsync.when(
        data: (record) {
          if (record == null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (context.mounted) context.pop();
            });
            return const SizedBox.shrink();
          }
          return _YakuContent(record: record);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text("Błąd: $error")),
      ),
    );
  }
}

final _yakuRecordProvider = FutureProvider.family<YakuRecord?, String>((
  ref,
  id,
) async {
  final repository = await ref.watch(yakuRepositoryProvider.future);
  return repository.getYakuById(id);
});

class _YakuContent extends StatelessWidget {
  final YakuRecord record;

  const _YakuContent({required this.record});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      record.originalJapaneseName,
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      record.romanizedJapaneseName,
                      style: textTheme.titleLarge,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      record.englishName,
                      style: textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ],
                ),
              ),
              ValueIconWidget(scoring: record.scoring, size: 60),
            ],
          ),
          const SizedBox(height: 20),
          MarkdownBody(data: record.description, shrinkWrap: true),
          if (record.conditions.isNotEmpty) ...[
            const SizedBox(height: 20),
            _ConditionsList(conditions: record.conditions),
          ],
          if (record.variants.isNotEmpty) ...[
            const SizedBox(height: 24),
            _VariantsSection(record: record),
          ],
        ],
      ),
    );
  }
}

class _ConditionsList extends StatelessWidget {
  const _ConditionsList({required this.conditions});

  final List<String> conditions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: conditions.map((condition) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('•  '),
              Expanded(child: Text(condition)),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _VariantsSection extends StatelessWidget {
  const _VariantsSection({required this.record});

  final YakuRecord record;

  @override
  Widget build(BuildContext context) {
    final variants = record.variants;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < variants.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Przykład ${i + 1}',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).hintColor,
                  ),
                ),
                const SizedBox(height: 6),
                MahjongTilesWidget(
                  sets: variants[i],
                  tileSize: 35,
                  displayMode: record.tileDisplayMode,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
