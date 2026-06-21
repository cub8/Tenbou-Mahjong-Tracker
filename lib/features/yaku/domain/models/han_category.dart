enum HanCategory {
  oneHan,
  twoHan,
  threeHan,
  fiveHan,
  yakuman,
  doubleYakuman;

  String get label => switch (this) {
    HanCategory.oneHan => '1 Han',
    HanCategory.twoHan => '2 Han',
    HanCategory.threeHan => '3 Han',
    HanCategory.fiveHan => '5 Han',
    HanCategory.yakuman => 'Yakuman',
    HanCategory.doubleYakuman => 'Double Yakuman',
  };
}
