enum MahjongTile {
  // Pinzu
  onePin,
  twoPin,
  threePin,
  fourPin,
  fivePin,
  sixPin,
  sevenPin,
  eightPin,
  ninePin,
  // Souzu
  oneSou,
  twoSou,
  threeSou,
  fourSou,
  fiveSou,
  sixSou,
  sevenSou,
  eightSou,
  nineSou,
  // Manzu
  oneMan,
  twoMan,
  threeMan,
  fourMan,
  fiveMan,
  sixMan,
  sevenMan,
  eightMan,
  nineMan,
  // Winds
  east,
  south,
  west,
  north,
  // Dragons
  haku, // white
  hatsu, // green
  chun, // red
  // Wildcard
  back;

  static MahjongTile fromString(String s) {
    return _map[s] ?? (throw ArgumentError("Unknown tile: ${s}"));
  }
}

const _map = {
  // Pinzu
  "1p": MahjongTile.onePin,
  "2p": MahjongTile.twoPin,
  "3p": MahjongTile.threePin,
  "4p": MahjongTile.fourPin,
  "5p": MahjongTile.fivePin,
  "6p": MahjongTile.sixPin,
  "7p": MahjongTile.sevenPin,
  "8p": MahjongTile.eightPin,
  "9p": MahjongTile.ninePin,
  // Souzu
  "1s": MahjongTile.oneSou,
  "2s": MahjongTile.twoSou,
  "3s": MahjongTile.threeSou,
  "4s": MahjongTile.fourSou,
  "5s": MahjongTile.fiveSou,
  "6s": MahjongTile.sixSou,
  "7s": MahjongTile.sevenSou,
  "8s": MahjongTile.eightSou,
  "9s": MahjongTile.nineSou,
  // Manzu
  "1m": MahjongTile.oneMan,
  "2m": MahjongTile.twoMan,
  "3m": MahjongTile.threeMan,
  "4m": MahjongTile.fourMan,
  "5m": MahjongTile.fiveMan,
  "6m": MahjongTile.sixMan,
  "7m": MahjongTile.sevenMan,
  "8m": MahjongTile.eightMan,
  "9m": MahjongTile.nineMan,
  // Winds
  "east": MahjongTile.east,
  "south": MahjongTile.south,
  "west": MahjongTile.west,
  "north": MahjongTile.north,
  // Dragons
  "haku": MahjongTile.haku,
  "hatsu": MahjongTile.hatsu,
  "chun": MahjongTile.chun,
  // Wildcard
  "back": MahjongTile.back,
};
