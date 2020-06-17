class DAppInfo {
  final String id;
  final String name;
  final String url;
  final String iconAsset;

  DAppInfo(this.id, this.name, this.url, this.iconAsset);
}

List<DAppInfo> dappList = [
  DAppInfo('1', 'M. CLUB LOCAL', 'http://127.0.0.1:3000',
      'assets/icons/dapp/loyalty-club.svg'),
  DAppInfo(
      '2',
      'M. CLUB DEV',
      'https://tw-loyalty-club-app.s3.us-east-2.amazonaws.com/www/dev/index.html',
      'assets/icons/dapp/loyalty-club.svg'),
  DAppInfo(
      '3',
      'M. CLUB QA',
      'https://tw-loyalty-club-app.s3.us-east-2.amazonaws.com/www/qa/index.html',
      'assets/icons/dapp/loyalty-club.svg'),
  DAppInfo('4', 'M. Enterprise LOCAL', 'http://127.0.0.1:3000/#/enterprise',
      'assets/icons/dapp/loyalty-enterprise.svg'),
  DAppInfo(
      '5',
      'M. Enterprise DEV',
      'https://tw-loyalty-club-app.s3.us-east-2.amazonaws.com/www/dev/index.html#/enterprise/login',
      'assets/icons/dapp/loyalty-enterprise.svg'),
  DAppInfo(
      '6',
      'M. Enterprise QA',
      'https://tw-loyalty-club-app.s3.us-east-2.amazonaws.com/www/qa/index.html#/enterprise/login',
      'assets/icons/dapp/loyalty-enterprise.svg')
];
