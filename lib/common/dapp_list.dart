class DAppInfo {
  final String id;
  final String name;
  final String url;
  final String iconAsset;

  DAppInfo(this.id, this.name, this.url, this.iconAsset);
}

List<DAppInfo> dappList = [
  DAppInfo('club-local', 'M. CLUB LOCAL', 'http://127.0.0.1:3000',
      'assets/icons/dapp/loyalty-club.svg'),
  DAppInfo(
      'club-dev',
      'M. CLUB DEV',
      'https://tw-loyalty-club-app-dev.s3.us-east-2.amazonaws.com/www/index.html',
      'assets/icons/dapp/loyalty-club.svg'),
  DAppInfo(
      'club-qa',
      'M. CLUB QA',
      'https://tw-loyalty-club-app-qa.s3.us-east-2.amazonaws.com/www/index.html',
      'assets/icons/dapp/loyalty-club.svg'),
  DAppInfo(
      'club-uat',
      'M. CLUB UAT',
      'https://tw-loyalty-club-app-uat.s3.us-east-2.amazonaws.com/www/index.html',
      'assets/icons/dapp/loyalty-club.svg'),
  DAppInfo(
      'club-prod',
      'M. CLUB',
      'https://tw-loyalty-club-app-prod.s3.us-east-2.amazonaws.com/www/index.html',
      'assets/icons/dapp/loyalty-club.svg'),
  DAppInfo(
      'enterprise-local',
      'M. Enterprise LOCAL',
      'http://127.0.0.1:3000/#/enterprise',
      'assets/icons/dapp/loyalty-enterprise.svg'),
  DAppInfo(
      'enterprise-dev',
      'M. Enterprise DEV',
      'https://tw-loyalty-club-app-dev.s3.us-east-2.amazonaws.com/www/index.html#/enterprise',
      'assets/icons/dapp/loyalty-enterprise.svg'),
  DAppInfo(
      'enterprise-qa',
      'M. Enterprise QA',
      'https://tw-loyalty-club-app-qa.s3.us-east-2.amazonaws.com/www/index.html#/enterprise',
      'assets/icons/dapp/loyalty-enterprise.svg'),
  DAppInfo(
      'enterprise-uat',
      'M. Enterprise UAT',
      'https://tw-loyalty-club-app-uat.s3.us-east-2.amazonaws.com/www/index.html#/enterprise',
      'assets/icons/dapp/loyalty-enterprise.svg'),
  DAppInfo(
      'enterprise-prod',
      'M. Enterprise',
      'https://tw-loyalty-club-app-prod.s3.us-east-2.amazonaws.com/www/index.html#/enterprise',
      'assets/icons/dapp/loyalty-enterprise.svg')
];
