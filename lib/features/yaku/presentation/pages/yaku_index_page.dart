import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:tenbou_mahjong/features/yaku/domain/models/han_category.dart';
import 'package:tenbou_mahjong/features/yaku/domain/usecases/yaku_by_value_use_case.dart';
import 'package:tenbou_mahjong/features/yaku/presentation/widgets/yaku_list_item_widget.dart';

class YakuIndexPage extends ConsumerWidget {
  const YakuIndexPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupedYakuAsync = ref.watch(_groupedYakuProvider);

    return DefaultTabController(
      length: HanCategory.values.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Yaku"),
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: HanCategory.values
                .map((category) => Tab(text: category.label))
                .toList(),
          ),
        ),
        body: groupedYakuAsync.when(
          data: (groupedYaku) => TabBarView(
            children: HanCategory.values.map((category) {
              final records = groupedYaku[category] ?? [];

              return ListView.builder(
                itemCount: records.length,
                itemBuilder: (context, index) =>
                    YakuListItemWidget(record: records[index]),
              );
            }).toList(),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text("Błąd: $error")),
        ),
      ),
    );
  }
}

final _groupedYakuProvider = FutureProvider((ref) async {
  final useCase = await ref.watch(yakuByValueUseCaseProvider.future);
  return useCase.groupYakuByValue();
});
