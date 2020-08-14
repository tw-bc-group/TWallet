class DAppInfo {
  final String id;
  final String name;
  final String url;
  final String iconAsset;

  DAppInfo(this.id, this.name, this.url, this.iconAsset);
}

List<DAppInfo> dappList = [
  // DAppInfo('dapp-1', 'M. CLUB LOCAL', 'http://127.0.0.1:3000',
  //     'assets/icons/dapp/loyalty-club.svg'),
  // DAppInfo(
  //     'dapp-2',
  //     'M. CLUB DEV',
  //     'https://tw-loyalty-club-app-dev.s3.us-east-2.amazonaws.com/www/index.html',
  //     'assets/icons/dapp/loyalty-club.svg'),
  // DAppInfo(
  //     'dapp-3',
  //     'M. CLUB QA',
  //     'https://tw-loyalty-club-app-qa.s3.us-east-2.amazonaws.com/www/index.html',
  //     'assets/icons/dapp/loyalty-club.svg'),
  DAppInfo(
      'dapp-7',
      'M. CLUB',
      'https://tw-loyalty-club-app-uat.s3.us-east-2.amazonaws.com/www/index.html',
      'assets/icons/dapp/loyalty-club.svg'),
  // DAppInfo(
  //     'dapp-9',
  //     'M. CLUB',
  //     'https://tw-loyalty-club-app-prod.s3.us-east-2.amazonaws.com/www/index.html',
  //     'assets/icons/dapp/loyalty-club.svg'),
  // DAppInfo(
  //     'dapp-4',
  //     'M. Enterprise LOCAL',
  //     'http://127.0.0.1:3000/#/enterprise',
  //     'assets/icons/dapp/loyalty-enterprise.svg'),
  // DAppInfo(
  //     'dapp-5',
  //     'M. Enterprise DEV',
  //     'https://tw-loyalty-club-app-dev.s3.us-east-2.amazonaws.com/www/index.html#/enterprise',
  //     'assets/icons/dapp/loyalty-enterprise.svg'),
  // DAppInfo(
  //     'dapp-6',
  //     'M. Enterprise QA',
  //     'https://tw-loyalty-club-app-qa.s3.us-east-2.amazonaws.com/www/index.html#/enterprise',
  //     'assets/icons/dapp/loyalty-enterprise.svg'),
  DAppInfo(
      'dapp-8',
      'M. Enterprise',
      'https://tw-loyalty-club-app-uat.s3.us-east-2.amazonaws.com/www/index.html#/enterprise',
      'assets/icons/dapp/loyalty-enterprise.svg'),
  // DAppInfo(
  //     'dapp-10',
  //     'M. Enterprise',
  //     'https://tw-loyalty-club-app-prod.s3.us-east-2.amazonaws.com/www/index.html#/enterprise',
  //     'assets/icons/dapp/loyalty-enterprise.svg')
];
