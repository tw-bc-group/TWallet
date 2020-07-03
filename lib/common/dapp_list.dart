class DAppInfo {
  final String id;
  final String name;
  final String url;
  final String iconAsset;

  DAppInfo(this.id, this.name, this.url, this.iconAsset);
}

List<DAppInfo> dappList = [
  DAppInfo(
      '1',
      'M. CLUB',
      'https://tw-loyalty-club-app-prod.s3.us-east-2.amazonaws.com/www/index.html',
      'assets/icons/dapp/loyalty-club.svg'),
  DAppInfo(
      '2',
      'M. Enterprise',
      'https://tw-loyalty-club-app-prod.s3.us-east-2.amazonaws.com/www/index.html#/enterprise',
      'assets/icons/dapp/loyalty-enterprise.svg')
];
