class CurrencyItem {
  final String title;
  final String subTitle;
  final String icon;
  final String trailingSubTitle;
  final double buyingRate;
  final double sellingRate;
  final double buyPercentage;
  final double sellPercentage;
  final bool isCurrencyRised;

  CurrencyItem({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.trailingSubTitle,
    required this.buyingRate,
    required this.sellingRate,
    required this.buyPercentage,
    required this.sellPercentage,
    required this.isCurrencyRised,
  });
}
